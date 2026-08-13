# Flutter Mobile App - AI Assistant Guidelines

> Single source of truth for AI coding rules in this repo.
> Hands-on commands (setup, flavors, codegen, lint, test) live in
> [DEVELOPMENT.md](DEVELOPMENT.md).

## Project Overview
Flutter mobile app (Android + iOS) — a QR code generator/scanner. Material 3 UI, no platform-specific UI frameworks.

## Commands
**Always prefix Flutter/Dart commands with `fvm`** — the project pins its Flutter version in `.fvmrc` via FVM.

- `fvm flutter pub get` — install dependencies
- `fvm flutter run --flavor <dev|stg|prod> --dart-define-from-file=env/<flavor>.json` — run on a device/emulator
- `fvm flutter analyze` — static analysis (run before considering a task done)
- `fvm flutter test` — unit + widget tests
- `fvm dart run build_runner build --delete-conflicting-outputs` — regenerate code after changing freezed models, json_serializable, or injectable bindings
- `fvm flutter gen-l10n` — regenerate localization Dart from ARB files

Full detail — flavor wiring, release signing, formatting caveats — in [DEVELOPMENT.md](DEVELOPMENT.md).

## Architecture
Clean architecture, layered (not feature-sliced):

- `lib/app/` — app shell: root widget, DI container, base classes, locale helper
  - `app/base/` — `BaseCubit<T>`, `CubitStateBuilder<T>`, `AppState` (loading/normal/error)
  - `app/di/injection.dart` — `getIt` instance + `@InjectableInit` config
  - `app/languages.dart` — `Languages.translate.<key>` accessor
- `lib/core/` — cross-cutting: `config/` (flavors), `constants/`, `navigation/` (named routes + `NavigatorKey` + `NavController`), `theme/`, `utils/`
- `lib/data/` — `datasources/`, `repositories/` (impl), `mapper/`
- `lib/domain/` — `entities/` (freezed models), `repositories/` (abstract)
- `lib/presentation/` — `screens/<feature>/` (page + cubit), `widgets/` (shared), `extension/`
- `lib/generated/` — generated localization output (do not edit)
- `lib/l10n/` — ARB source files
- `env/` — per-flavor compile-time values, read via `--dart-define-from-file`

## State Management
- `flutter_bloc` Cubit pattern. Every cubit extends `BaseCubit<T>` (`lib/app/base/base_cubit.dart`).
- Emit via `emitNormal(data)`, `emitLoading()`, `emitError(...)` — do not call `emit(...)` directly.
- UI subscribes via `CubitStateBuilder<T>` (`lib/app/base/bloc_state_builder.dart`) which handles the `AppState` loading/normal/error union.
- One cubit per screen, colocated under `lib/presentation/screens/<feature>/<feature>_cubit.dart`.

## Dependency Injection
- `get_it` + `injectable`. Annotate with `@singleton`, `@lazySingleton`, or `@injectable`.
- Resolve via `getIt.get<T>()` (imported from `lib/app/di/injection.dart`).
- After adding/removing/renaming an injectable class, run `dart run build_runner build --delete-conflicting-outputs` to refresh `injection.config.dart`.
- **Anything registered per-environment must be registered for *every* flavor.** `configureDependencies` receives `AppConfig.current.flavor.value`, so a binding annotated only `@dev` / `@prod` simply does not exist under `stg` — and a missing `Logger` takes `AppLogger` down with it, before the first frame. `@Environment('<value>')` strings must match `Flavor.value` in `lib/core/config/environment.dart`.
- Release builds pin `Logger(level: Level.warning)`. `Logger` defaults to `Level.trace`, which would ship every cubit state transition — contents included — to logcat on user devices.

## Freezed Models (v3)
- Use `abstract class` + `@freezed` (freezed v3 pattern), not the legacy mixin form.
- Part files live in a `generated/` subfolder next to the source: `part 'generated/<name>.freezed.dart';` and `part 'generated/<name>.g.dart';` when serialization is needed.
- Rerun build_runner after any signature change.

## Localization
- **Never hardcode user-facing text.** All strings go through `Languages.translate.<key>`.
- Source of truth: `lib/l10n/app_en.arb`. Vietnamese mirror: `lib/l10n/app_vi.arb` — both files must stay in sync (same set of keys).
- Access in code: `import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';` then `Languages.translate.<key>`.
- After adding/changing ARB keys, run `flutter gen-l10n`. Generated output: `lib/generated/l10n/app_localizations.dart` (do not edit).

## Theming
- Material 3 only (`useMaterial3: true`). Light + dark themes are derived from the user-selected `AppColorTheme` enum in `lib/core/theme/color_schemes.dart` via `getThemeData(bool isDarkTheme)`.
- To add a new theme color: add an enum value in `AppColorTheme`, extend the `switch` in `getColorScheme`, and add matching `ColorScheme` constants in `_AppColorSchemes`.
- Typography: `AppTypography.defaultTextTheme` (`lib/core/theme/typography.dart`).
- Read theme through `BuildContextX` (`context.colorScheme`, `context.textTheme`) or `Theme.of(context)` — never hardcode colours or text styles.
- Spacing / radius come from `AppSpacing` / `AppRadius` (`lib/core/theme/dimensions.dart`). Do not write a bare `EdgeInsets.all(8)`, and do not declare a private constant inside a widget instead — scattered constants mean nobody can see the total when the scale changes.
- Avoid deprecated `Color.value` and `Color.withOpacity` — use `.toARGB32()` / `.withValues(alpha: ...)` (the analyzer will flag the rest).

## Navigation
- Named routes via `AppRouter.onGenerateRoute` (`lib/core/navigation/app_router.dart`) wired into `MaterialApp.onGenerateRoute`. Route arguments are `AppRoutes` subclasses (`lib/core/navigation/app_routes.dart`) — the router rejects anything else and falls through to the "page not found" screen.
- **Every `MaterialPageRoute` in `AppRouter` must pass `settings: settings`.** `MaterialPageRoute` does not inherit the `RouteSettings` of the `pushNamed` call that created it; leave it out and `route.settings.name` is `null`. Nothing breaks until the first `NavController.popUntil` call, which matches on that name, finds no route, and pops the **entire stack** to a blank screen.
- **All navigation goes through `NavController`** (`lib/core/navigation/app_navigator.dart`). Do not call `Navigator.of(context)` in widgets, and do not add push/pop helpers to `BuildContextX` — two owners for one back stack is how these bugs start, and a route pushed directly bypasses `AppRouter` and lands in the trap above.
- Use `pushNamedAndRemoveUntilRoute(route)` (typed) for "replace the whole flow" transitions. `pushReplacementNamed` only swaps the topmost route. The older `pushNamedAndRemoveUntil(String, arguments: Map)` cannot reach a real screen — the router rejects a `Map`.
- `NavigatorKey.key` is the global key for navigating from outside a `BuildContext` (cubits, services).

## Screen Layout

**Avoid `IntrinsicHeight`.** It runs an extra intrinsic-sizing pass before layout,
and the cost compounds when nested. Reaching for it is a **stop**: say what forces
it and what the alternative costs, and get agreement first.

The case that keeps producing it is a screen wanting a bottom CTA: `Spacer` needs
a bounded main axis, `SingleChildScrollView` hands down an unbounded one
(`ConstrainedBox(minHeight:)` raises the floor, the ceiling stays `Infinity`), so
`IntrinsicHeight` gets added to make the flex resolve. Use a pinned footer instead:

```dart
Column(children: [
  Expanded(child: SingleChildScrollView(child: Column(...content...))),
  <footer with the primary action>,
])
```

`Expanded` sits inside a `Column` already bounded by `Scaffold.body`, so the
scroll view has a real ceiling and nothing needs intrinsics. It also keeps the CTA
on screen — at large text scales a scroll-away button can end up far below the
fold.

Related: an action row with two natural-width buttons belongs in a `Wrap`, not a
bare `Row`. A slightly long label pair overflows a `Row` at 360dp, and at
textScale 2.0 essentially every pair does (see `AppDialog`).

## One job, one widget

Check `lib/presentation/widgets/` **before** writing a new widget. The failure
mode is not a missing widget, it is a second implementation of one that already
exists — and the hand-rolled copy usually breaks a rule the shared one honours.

| Job | Use |
|---|---|
| Transient toast | `LoadingUtil.showSuccess` / `showError` / `showInfo` |
| Blocking full-screen wait | `LoadingUtil.show()` / `dismiss()` — reference-counted, has a safety timer |
| Wait inside content | `AppLoadingView` (the `CubitStateBuilder` default) |
| Error block inside content | `AppErrorView` (built on `AppEmptyState`) |
| Empty / no-data block | `AppEmptyState` |
| Confirmation dialog | `AppDialog` |
| Screen shell | `AppScaffold` |
| List row | `AppTile` |
| Text input | `AppTextField` |
| Dropdown | `AppDropdown` |
| Bottom sheet | `AppBottomSheet` |
| Fixed-size spacer | `AppGap` |

Two consequences worth stating outright:

- **There is exactly one toast mechanism.** `LoadingUtil` is it. Two notification
  systems side by side can never look alike, and which one a user sees ends up
  depending on which screen they are on. `EasyLoading` also mounts its own
  overlay, so a cubit can raise a toast with no `BuildContext` — no borrowing
  `NavigatorKey.key.currentContext`, which is exactly the context that dies while
  navigation tears the stack down.
- **A shared widget with no call site is not automatically dead code.** Reach for
  it; do not rebuild it under a new name.

## Settings Persistence
- App-level settings (language, theme mode, color theme, notifications) are modeled in `AppSettings` (freezed) and persisted by `AppSettingRepository`. Mutations go through `SettingsCubit` so the whole app reactively rethemes/relocalizes.

## Conventions
- Match the existing layered structure — do not introduce a `features/` slice.
- Keep widgets dumb; put logic in the cubit.
- One screen = one folder under `lib/presentation/screens/<feature>/` containing the page widget, the cubit, and any feature-local `components/`.
- Reusable widgets go in `lib/presentation/widgets/` with the `App*` prefix (e.g. `AppDropdown`, `AppScaffold`, `AppTile`).
- A flavor name is spelled in several places — `env/<flavor>.json`, `Flavor.value`, `productFlavors` in `android/app/build.gradle.kts`, and on iOS the scheme, the `<Mode>-<flavor>` build configurations, the `<flavor>-<Mode>.xcconfig` files and the Podfile config map. Changing one means changing all of them; the table in [DEVELOPMENT.md](DEVELOPMENT.md) §4 is the checklist.
- Per-flavor bundle id and display name live **only** in `ios/Flutter/<flavor>-<Mode>.xcconfig` and in `android/app/build.gradle.kts` — do not also hardcode them in the Xcode target build settings or the manifest.
- Run `fvm flutter analyze` **and** `fvm flutter test`, and clear both, before declaring a task done.
