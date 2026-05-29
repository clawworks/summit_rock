# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this app does

Summit Rock is a Flutter app that helps users solve the "Summit Rock" scavenger-hunt puzzle. The puzzle's clues are encoded as letter/symbol rings (e.g. on a T-shirt or medallion). The user enters a sequence of `numbers` (optionally with manually inserted letters), and the app decodes candidate words by rotating each number against every position of every cipher ring. Words that match an English dictionary are surfaced as "favorites". Everything is scoped by `SummitRockYear` (2024 vs 2025), which changes which rings exist, the theme color, and Firestore filtering.

## Commands

```bash
flutter pub get                  # install deps
flutter run                      # run (Firebase is configured for iOS/Android/web)
flutter analyze                  # static analysis (flutter_lints + custom_lint/riverpod_lint)
flutter test                     # run all tests
flutter test test/widget_test.dart --plain-name 'Counter increments smoke test'   # single test

# Code generation — REQUIRED after editing any @freezed model, @riverpod provider,
# or @JsonEnum. Generated *.g.dart / *.freezed.dart files are committed.
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs   # leave running while developing
```

There is no FVM pin; uses the ambient Flutter SDK (Dart `>=3.2.3 <4.0.0`). `build.yaml` sets `json_serializable` `explicit_to_json: true`.

## Architecture

Feature-first layering (the "Code With Andrea" / Flutter Firebase Masterclass convention). Code lives in `lib/src/`, split into `common_widgets/`, `routing/`, `utilities/`, and `features/<feature>/`. Each feature is divided into up to four layers:

- **`data/`** — Repositories that talk to Firebase directly (`ResultsRepository`, `AuthRepository`). They take raw IDs as arguments and know nothing about the current user.
- **`application/`** — Services that compose repositories with auth context. `ResultService` reads `authRepository.currentUser` and injects `user.uid` into every repository call (throwing if null). UI should generally go through services, not repositories.
- **`domain/`** — Models and typedefs. Models are Freezed + `json_serializable` (`Result`); enums use `@JsonEnum(alwaysCreate: true)` (`SummitRockYear`, `RockNumber`). `AppUser` is a hand-written base class subclassed by `FirebaseAppUser`.
- **`presentation/`** — Widgets plus `*_controller.dart` files. Controllers are Riverpod `Notifier`s (`@riverpod` / `@Riverpod(keepAlive: true)`) that own UI logic and mutations.

State management is **Riverpod with code generation** (`riverpod_annotation`, `hooks_riverpod`, `flutter_hooks`). Providers are declared via `@riverpod` annotations and `part '*.g.dart'`. The app root is wrapped in `ProviderScope` (see `lib/main.dart`).

### The year system is global and cross-cutting

`SummitRockYear` (`twentyFour`, `twentyFive`; default `twentyFive`) is selected via `YearSelection` (`yearSelectionProvider`, keepAlive). It drives:
- `encodedListsProvider` — filters `EncodedList.values` to the rings for the active year.
- `colorSchemeProvider` — the `MaterialApp` theme color (green for 2024, blue for 2025).
- `specialIndexes` — highlighted N/E/S/W starting positions per year.
- Firestore queries — `FilterByYear` (`filterByYearProvider`) toggles whether history is filtered to the selected year.

When adding year-specific behavior, extend these providers/switches rather than branching ad hoc. Note: a new `EncodedList` value must be wired in three places — its `year` in the enum constructor, its `toString()` label, and its ring-decoding case in `WordDecoderController._getDecodedList`.

### The decoder

`WordDecoderController.getResults` (in `word_decoder/presentation/`) is the core. For each active `EncodedList` it rotates the user's `numbers` against the ring's letters: normal decode uses `(i + num) % len`, reverse uses `(i - num) % len`. `letterMap` entries are then spliced in at fixed indices. Decoded words matching the English dictionary (`listEnglishWordsProvider`) become `favorites`. The result is persisted via `ResultService.setResult`. The hard-coded ring arrays (`_outsideRing24`, `_ticksRing25`, etc.) live as fields on this controller.

### Routing & auth

`go_router` is configured in a single `goRouterProvider` (`lib/src/routing/app_router.dart`). Route *names* are constants on `AppRoute` (navigate with `context.goNamed(AppRoute.home)`); they are names, not paths. A `redirect` gates everything on auth state (anonymous or email/password via Firebase Auth) and refreshes on `authStateChanges()` via `GoRouterRefreshStream`. Admin gating exists in the redirect (`user.isAdmin()`, `/admin` prefix) but `AppUser.isAdmin()` currently returns `false` and no admin routes are defined yet.

### Backend

Firebase (project `summit-rock`): Auth + Cloud Firestore. Results are stored per user at `/users/{uid}/results/{resultId}`, where `resultId` is the numbers joined by `_` (`WordDecoderController._makeId`). `ResultsRepository` uses typed `withConverter` (`Result.fromJson` / `toJson`) and `set(..., merge: true)`.

## Conventions & gotchas

- After any model/provider/enum change, regenerate code or the build breaks. Don't hand-edit `*.g.dart` / `*.freezed.dart`.
- The codebase contains large blocks of commented-out code kept as reference (especially `results_repository.dart`); leave it unless asked to clean up.
- `print()` is used liberally for debugging, including in the router redirect — it is not an error to remove, but match the surrounding style if adding logging.
- `test/widget_test.dart` is still the default Flutter counter scaffold (mostly commented out); there is no real test coverage yet.
