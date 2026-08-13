# Development guide

This file is the **hands-on half**: setup, running, code generation, lint, test.
Code conventions (architecture, state management, theming, what to use when) live
in [CLAUDE.md](CLAUDE.md).

---

## 1. Requirements

- **FVM** (Flutter Version Management). The Flutter version this project builds
  against is pinned in [.fvmrc](.fvmrc) — currently **3.44.6**. Install FVM from
  <https://fvm.app>, then `fvm install` to fetch that version if the machine does
  not have it yet.
- **Always prefix with `fvm`** (`fvm flutter …`, `fvm dart …`). Do not call
  `flutter` / `dart` directly even when the global version happens to match:
  calling it directly drops the pin for whoever (or whatever CI) runs next.
- Android Studio + SDK for Android; Xcode for iOS (`pod install` inside `ios/` on
  first checkout).

## 2. First-time setup

```bash
fvm install          # fetch the Flutter version from .fvmrc
fvm flutter pub get
```

## 3. Code generation — rerun after changing the matching source

Two generators, two different sources. **Run both from the repo root.**

| When you change… | Run | It writes |
|---|---|---|
| a `@freezed` model, a `@injectable` / `@singleton` class, `json_serializable` | `fvm dart run build_runner build --delete-conflicting-outputs` | `**/generated/*.freezed.dart`, `**/generated/*.g.dart`, `lib/app/di/injection.config.dart` |
| `lib/l10n/app_en.arb` or `app_vi.arb` | `fvm flutter gen-l10n` | `lib/generated/l10n/*.dart` |

> **Never hand-edit** anything inside a `generated/` folder — the next generator
> run overwrites it.

After `build_runner`, always run `fvm flutter analyze`: a changed model or DI
signature is the most likely thing to have broken.

## 4. Running — flavors

Three flavors: `dev`, `stg`, `prod`. A flavor name is spelled the same in several
places, and they all have to agree:

| Place | What it is |
|---|---|
| `env/<flavor>.json` | compile-time values (`FLAVOR`, `APP_NAME`, `API_BASE_URL`, …) |
| `Flavor.value` in [lib/core/config/environment.dart](lib/core/config/environment.dart) | the Dart enum |
| `productFlavors` in [android/app/build.gradle.kts](android/app/build.gradle.kts) | the Android build variant |
| `ios/Runner.xcodeproj/xcshareddata/xcschemes/<flavor>.xcscheme` | the Xcode scheme `--flavor` selects |
| `Debug-<flavor>` / `Release-<flavor>` / `Profile-<flavor>` in `project.pbxproj` | the Xcode build configurations |
| `ios/Flutter/<flavor>-<Mode>.xcconfig` | bundle id + display name for that configuration |
| the `project 'Runner', {...}` map in [ios/Podfile](ios/Podfile) | tells CocoaPods which configs are debug vs release |

```bash
fvm flutter run --flavor dev  --dart-define-from-file=env/dev.json
fvm flutter run --flavor stg  --dart-define-from-file=env/stg.json
fvm flutter run --flavor prod --dart-define-from-file=env/prod.json
```

Both parts are needed. `--dart-define-from-file` is what
`AppConfig.fromEnvironment()` reads, and the resulting
`AppConfig.current.flavor.value` is handed to `configureDependencies(...)`, which
is what selects the `@Environment('<flavor>')` bindings in
[lib/app/di/injection.dart](lib/app/di/injection.dart). `--flavor` is what picks
the Android variant — each flavor carries its own `applicationIdSuffix`, so dev /
stg / prod install side by side instead of replacing each other, and its own
`app_name` string resource for the launcher label.

Both parts are needed on iOS too: `--flavor stg` selects the **scheme** named
`stg`, and Flutter then resolves the build configuration named
`<BuildMode>-<scheme>` (`Debug-stg`, `Release-stg`, `Profile-stg`). Each of those
points at `ios/Flutter/stg-<Mode>.xcconfig`, which is the **only** place the
per-flavor `PRODUCT_BUNDLE_IDENTIFIER` and `APP_DISPLAY_NAME` are set — the
target's build settings deliberately do not define them, so there is one source
of truth. `Info.plist` reads `$(APP_DISPLAY_NAME)` for `CFBundleDisplayName`.

**Adding a flavor means touching every row of the table above, plus a
`@Environment` binding for anything registered per-environment.** A flavor with
no `Logger` registered takes down `configureDependencies` at startup, before the
first frame.

To check the wiring without a device:

```bash
fvm flutter build ios --config-only --no-codesign --flavor stg --dart-define-from-file=env/stg.json
```

It prints the bundle identifier it resolved — that is the fastest proof the
scheme → configuration → xcconfig chain is intact.

Adding a flavor on iOS by hand means editing `project.pbxproj`. It is easier in
Xcode: duplicate an existing configuration under *Project → Info → Configurations*,
name it `<Mode>-<flavor>`, point it at the new xcconfig, then duplicate a scheme
and set its five actions to the matching configurations.

### Release signing (Android)

`android/app/build.gradle.kts` reads keystore credentials from
`android/key.properties`, which is git-ignored and **not** in the repo:

```properties
storePassword=…
keyPassword=…
keyAlias=…
storeFile=…/upload-keystore.jks
```

The file is optional by design — without it debug and profile builds still work,
and only `--release` fails. A fresh clone does not need the keystore to run the
app.

## 5. Lint / format / test

```bash
fvm dart format <the files you changed>   # formatting
fvm flutter analyze                       # MUST be clean before a task is done
fvm flutter test                          # unit + widget tests
```

> ⚠️ `fvm dart format .` (whole repo) touches a number of files that were never
> formatted — pre-existing debt, not your MR's job. Formatting everything is its
> own cleanup commit; until then, format only the files you touched.
> To see the list: `fvm dart format --output=none --set-exit-if-changed .`

## 6. Current limitations

- **No test suite yet** beyond the default `test/widget_test.dart`, which is
  still the Flutter counter template and does not match this app.
- **iOS release signing is not configured.** The `Release-*` configurations carry
  no `DEVELOPMENT_TEAM`; archiving needs a team and provisioning profiles set in
  Xcode first. Android's release signing is wired (§4).
