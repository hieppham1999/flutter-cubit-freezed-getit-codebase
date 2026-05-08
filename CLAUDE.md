# Flutter Mobile App - AI Assistant Guidelines

> Single source of truth for AI coding rules in this repo.

## Project Overview
Flutter mobile app (Android + iOS) — a QR code generator/scanner. Material 3 UI, no platform-specific UI frameworks.

## Commands
- **Always prefix Flutter/Dart commands with `fvm`** — project uses FVM for Flutter version management.
  - `fvm flutter pub get` — install dependencies
  - `fvm flutter run` — run on a connected device/emulator
  - `fvm flutter analyze` — static analysis (run before considering a task done)
  - `fvm dart run build_runner build --delete-conflicting-outputs` — regenerate code after changing freezed models, json_serializable, or injectable bindings
  - `fvm flutter gen-l10n` — regenerate localization Dart from ARB files

## Architecture
Clean architecture, layered (not feature-sliced):

- `lib/app/` — app shell: root widget, DI container, base classes, locale helper
  - `app/base/` — `BaseCubit<T>`, `CubitStateBuilder<T>`, `AppState` (loading/normal/error)
  - `app/di/injection.dart` — `getIt` instance + `@InjectableInit` config
  - `app/languages.dart` — `Languages.translate.<key>` accessor
- `lib/core/` — cross-cutting: `constants/`, `navigation/` (named routes + `NavigatorKey`), `theme/`, `utils/`
- `lib/data/` — `datasources/`, `repositories/` (impl), `mapper/`
- `lib/domain/` — `entities/` (freezed models), `repositories/` (abstract)
- `lib/presentation/` — `screens/<feature>/` (page + cubit), `widgets/` (shared), `extension/`
- `lib/generated/` — generated localization output (do not edit)
- `lib/l10n/` — ARB source files

## State Management
- `flutter_bloc` Cubit pattern. Every cubit extends `BaseCubit<T>` (`lib/app/base/base_cubit.dart`).
- Emit via `emitNormal(data)`, `emitLoading()`, `emitError(...)` — do not call `emit(...)` directly.
- UI subscribes via `CubitStateBuilder<T>` (`lib/app/base/bloc_state_builder.dart`) which handles the `AppState` loading/normal/error union.
- One cubit per screen, colocated under `lib/presentation/screens/<feature>/<feature>_cubit.dart`.

## Dependency Injection
- `get_it` + `injectable`. Annotate with `@singleton`, `@lazySingleton`, or `@injectable`.
- Resolve via `getIt.get<T>()` (imported from `lib/app/di/injection.dart`).
- After adding/removing/renaming an injectable class, run `dart run build_runner build --delete-conflicting-outputs` to refresh `injection.config.dart`.

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
- Prefer `Theme.of(context).colorScheme.<role>` and `Theme.of(context).textTheme.<variant>` over hardcoded colors / text styles.
- Avoid deprecated `Color.value` and `Color.withOpacity` — use `.toARGB32()` / `.withValues(alpha: ...)` (the analyzer will flag the rest).

## Navigation
- Named routes via `AppRouter.onGenerateRoute` (`lib/core/navigation/app_router.dart`) wired into `MaterialApp.onGenerateRoute`.
- Global navigator key: `NavigatorKey.key` — use it for navigation from outside a `BuildContext` (e.g. cubits, services).

## Settings Persistence
- App-level settings (language, theme mode, color theme, notifications) are modeled in `AppSettings` (freezed) and persisted by `AppSettingRepository`. Mutations go through `SettingsCubit` so the whole app reactively rethemes/relocalizes.

## Conventions
- Match the existing layered structure — do not introduce a `features/` slice.
- Keep widgets dumb; put logic in the cubit.
- One screen = one folder under `lib/presentation/screens/<feature>/` containing the page widget, the cubit, and any feature-local `components/`.
- Reusable widgets go in `lib/presentation/widgets/` with the `App*` prefix (e.g. `AppDropdown`, `AppScaffold`, `AppTile`).
- Run `flutter analyze` and clear errors before declaring a task done.
