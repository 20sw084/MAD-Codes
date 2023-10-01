# firebase_flutter

A new Firebase-Flutter project.

## Getting Started

Step # 01: Go to https://console.firebase.google.com/
Step # 02: Add a project & create it (Give it a suitable name, Enable Google Analytics, Configure Google Analytics by selecting any account)
Step # 03: Go to your project Dashboard and add a flutter project by clicking on flutter icon.
1. Prepare your workspace
   The easiest way to get you started is to use the FlutterFire CLI.
   Before you continue, make sure to:
   a. Install the Firebase CLI(https://firebase.google.com/docs/cli?hl=en&authuser=0&_gl=1*5eygcf*_ga*MTY2NTE5MjQ2LjE2OTU3NDk3NTg.*_ga_CW55HF8NVT*MTY5NTkyMzEwNy4xMy4xLjE2OTU5MjUyNDQuMTcuMC4w#install-cli-windows) and log in (run firebase login)
   b. Install the Flutter SDK(https://docs.flutter.dev/get-started/install). Dont install it again, if you already have.
   c. Create a Flutter project (run flutter create)
2. Open firebase-tools-instant-win in admin mode and From any directory, run this command:
       dart pub global activate flutterfire_cli
   Copy firebase-tools-instant-win and paste it to your root folder of flutter project. Rename it to only firebase.
   Then, at the root of your Flutter project directory (using cd command), run this command:
       flutterfire configure --project=fir-flutter-1ac5a
   This automatically registers your per-platform apps with Firebase and adds a lib/firebase_options.dart configuration file to your Flutter project.
3. Continue to console now.  That's it.
