import 'package:flutter/material.dart';
import 'package:oddjob/homepage.dart';
import 'package:oddjob/login_page/login.dart';
import 'package:provider/provider.dart';
import 'createPostPage/create_post.dart';
import 'models/posts_list._model.dart';

void main() {
  runApp(MyApp());
}

// ToDo: Think about Whether or not we will need just a single Provider, or a MultiProvider!

// This is our app, this is where it calls each other class in order to function:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PostListModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent,
            primaryColorLight: Colors.white,
            primaryColorDark: Colors.black54,
            accentColor: Colors.deepOrange,
          ),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the LoginScreen page.
            '/': (context) => LoginPage(),
            // When navigating to the "/homepage" route, build the HomePage page.
            '/home_page': (context) => HomePage(),
            // This is the route to the Create Post page.
            '/create_post': (context) => CreatePost(),
          },
        )
    );
  }
}


