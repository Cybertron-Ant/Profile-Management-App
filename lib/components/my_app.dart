import 'package:flutter/material.dart';
import 'package:towers/components/profile_screen.dart';

// 'MyApp' widget to be run if Firebase initializes successfully
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // set 'StatelessTemplate' widget as the home screen
      // means 'StatelessTemplate' will be the first screen shown in the app
      home: ProfileScreen(),

    );
  } // end 'build' overridden method

} // end 'MyApp' widget class