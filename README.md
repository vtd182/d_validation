# d_validation

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## IDE setup 
### Prerequisites
- Dart: https://dart.dev/get-dart
- Flutter: https://docs.flutter.dev/get-started/install

### Android Studio 
- First we need install two plugins for dart and flutter by Setting -> Plugins -> Marketplace and install them
- Restart the IDEA
- Select the specific device and run
<img width="949" alt="Screenshot 2025-01-13 at 01 56 38" src="https://github.com/user-attachments/assets/75df2546-7854-4858-855b-73d7f176e97d" />

### VS-Code
- https://docs.flutter.dev/get-started/editor

### Validate config
```
flutter doctor
```

## Installation 

Add dependency to your `pubspec.yaml` 

```yaml
dependencies:
  d_validation:
    git:
      url: https://github.com/vtd182/d_validation
      ref: master
  // ...other dependency
```

Run on terminal to sync package
```terminal
flutter pub get
```

## Document 

For class document, run 
```terminal
dart doc
```

The generated file will be in `/doc/api`, to watch them, run 
```
npx serve ./doc/api
```
This will allow us to watch them on web browser.

## Run application 
To run the example application on `main.dart`, first we need to build them:
```
flutter build apk|ios|macos|web
```

Then attach app to specific devices. For example, if we build flutter app to web
```
flutter build web
```
Serve it
```
npx serve ./build/web
```




