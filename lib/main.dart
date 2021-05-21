import 'package:flutter/material.dart';
import 'package:oddjob/homepage.dart';
import 'package:oddjob/login_page/login.dart';
import 'createPostPage/create_post.dart';

// Runs the app:
void main() => runApp(MyApp());

// This is our app, this is where it calls each other class in order to function:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black54,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the LoginScreen page.
        '/': (context) => LoginPage(),
        // When navigating to the "/homepage" route, build the HomePage page.
        '/home_page': (context) => HomePage(),
        '/create_post': (context) => CreatePost(),
      },
    );
  }
}
