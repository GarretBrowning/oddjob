import 'package:flutter/material.dart';
import 'package:oddjob/login_page/login.dart';

// Runs the app:
void main() => runApp(MyApp());

// This is our app, this is where it calls each other class in order to function:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}


