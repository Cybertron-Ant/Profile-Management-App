# How to Setup Flutter and Dart for Android Studio

#### N.B - follow all the steps even tho you some of them may not work(throw errors). Create a flutter project in Android Studio -> click 'Tools' -> 'Flutter' -> 'Flutter docter'. Complete the below steps first before attempting this.

## Step-by-Step Guide

### Setting Environment Variables

1. **Open Environment Variables:**
   - Navigate to **Environment Variables**.
   - Under **System Variables**, click **New**.
   - In the **Variable name** field, input `ANDROID_HOME`.
   - In the **Variable value** field, input the file path to your Android SDK. For example, `C:\antboy\AppData\Local\Android\Sdk`.
   - Click **OK**.

2. **Updating System Path:**
   - Under **System variables**, click **Path**.
   - Click **New** each time to add the following paths, assuming `src` is the folder where your Flutter SDK is stored:
      - `C:\src\flutter\bin`
      - `%ANDROID_HOME%\tools`
      - `%ANDROID_HOME%\tools\bin`
      - `%ANDROID_HOME%\platform-tools`
   - Click **OK**.

3. **Updating User Path:**
   - Under **User variables**, click **Path**.
   - Click **New** each time to add the following paths (your file paths may vary but will be similar):
      - `C:\antboy\AppData\Local\Android\Sdk`
      - `C:\antboy\Android Studio\jbr`
      - Path to your Dart SDK: `C:\dart\dart-sdk\bin`
      - Path to your Android command line tools: `C:\antboy\AppData\Local\Android\Sdk\cmdline-tools\latest\bin`
      - Path to your Flutter SDK: `C:\flutter\flutter\bin`
   - Click **OK**.

### Configuring Flutter and Dart

4. **Open Command Prompt:**
   - Type `flutter doctor --android-licenses`.
   - Type `y` to accept each license.

5. **Verify Installation:**
   - Close the terminal, reopen it, and type `flutter doctor`.
   - Type `adb --version` to check if `adb` is now accessible. This ensures the detection of your connected Android device via USB for deploying your Flutter apps.


    To develop Windows apps, install the "Desktop development with C++" workload, including all of its default components at https://visualstudio.microsoft.com/downloads/.

By following these steps, you will have set up Flutter and Dart in Android Studio, ensuring your environment is configured correctly for developing and deploying Flutter applications.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

commands used:
flutter pub add flutter_launcher_icons --dev
flutter pub run flutter_launcher_icons:main

pubspec.yaml file:
flutter_icons:
android: true
ios: true
remove_alpha_ios: true
image_path: "assets/logo.png"

be sure to add all unversioned IOS images files

misc:
flutter pub deps - check/list dependencies
flutter pub remove change_app_package_name - remove specified dependency/package
terminal: flutter clean flutter pub get

change package name:
flutter pub run change_app_package_name:main com.kaibacorp.test_package_name
rename getAppName --targets ios

output the current AppName for the iOS platform or for multiple targets:
rename getAppName --targets ios,android,macos,windows,linux


## set up flutterfire and connect apps to firebase project:
download nodejs:
https://nodejs.org/en

run commands:
dart pub global activate flutterfire_cli
flutterfire configure

type in Android Studio terminal:
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
npm install -g firebase-tools
firebase --version
firebase login
dart pub global activate flutterfire_cli

connect to your firebase project using the project id:
flutterfire configure --project=project-one-bbbef

select/check the platforms you want your app to be deployed on using the 'space bar'

import 'firebase_core' dependency to get rid of all errors in 'firebase_options.dart' file:
flutter pub add firebase_core

## Sync and Rebuild project:
flutter clean
flutter pub get
flutter build

set minSdk and targetSdk in 'build.gradle' file inside 'app' folder

build.gradle:
configurations.all {
resolutionStrategy.eachDependency { DependencyResolveDetails details ->
if (details.requested.group == 'org.jetbrains.kotlin') {
details.useVersion '1.8.22'
}
}
}

example commands to reconfigure or add a new OS(android, IOS, Linux, MacOS) app to firebase:
flutterfire configure --project=project-one-bbbef
com.kaibacorp.firebasetest43 