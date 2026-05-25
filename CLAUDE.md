# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Dependencies
flutter pub get

# Run (debug)
flutter run

# Test
flutter test                        # all tests
flutter test test/widget_test.dart  # single test file

# Lint & format
flutter analyze
dart format lib/ test/

# Build
flutter build apk     # Android
flutter build web     # Web
flutter build windows # Windows
```

## Architecture

This is a minimal Flutter app (Material 3, Dart 3.12+, multi-platform) using plain `setState` — no external state management library.

**Layer structure:**

- `lib/main.dart` — app entry point; configures `MaterialApp` with a teal `ColorScheme.fromSeed` theme
- `lib/screens/` — full-page `StatefulWidget`s that own state and business logic
- `lib/widgets/` — pure presentation `StatelessWidget`s that receive data and callbacks via constructor

**Widget/state ownership pattern:**

State lives in screen widgets; UI components in `widgets/` are callback-driven and stateless. Example: `CounterButtons` renders increment/decrement buttons but holds no state — it receives `VoidCallback` props from `MyHomePage`.

**Navigation:** `Navigator.push` with `MaterialPageRoute` (no named routes or router package).

**Resource management:** `TextEditingController` and similar disposable resources are initialised in `initState` and cleaned up in `dispose` (see `lib/screens/screen.dart`).

## Code Style

- Comments are written in Italian (project convention).
- Linter: `flutter_lints` via `analysis_options.yaml` (no overrides active).
