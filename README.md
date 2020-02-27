# connection_verify

Package to verify the network connection status

## Example

```dart 
if (await ConnectionVerify.connectionStatus()){
      print("I have network connection!");
      //Do your online stuff here
    } else {
      print("I don't have network connection!");
      //Do your offline stuff here
    }
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
