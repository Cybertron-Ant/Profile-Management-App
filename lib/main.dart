import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/error_app.dart';
import 'components/my_app.dart';
import 'database_connections/firebase_init.dart';


// 'MaterialApp' widget as the root
// the 'Firebase' initialization should be completed before running the app
void main() async {
  // ensure Flutter binding is initialized before any asynchronous code
  WidgetsFlutterBinding.ensureInitialized(); // ensure binding before Firebase initialization

  // try to initialize 'Firebase' with the default options for the current platform
  try {
    // wait for Firebase to be initialized before executing other code
    // initialize Firebase using the FirebaseInitializer class
    FirebaseApp firebaseApp = await FirebaseInitializer.initializeFirebase();

    // print initialization status
    print("Firebase initialized successfully yay! :-) : $firebaseApp");

    // run the Flutter application with 'MaterialApp' as the root widget
    runApp(MyApp());

  } catch (e) {
    // if Firebase initialization fails, print error and run the error app
    print("Error initializing Firebase: $e");
    runApp(ErrorApp(errorMessage: e.toString()));

  } // end 'CATCH'

} // end 'main' asynchronous function