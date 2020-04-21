import 'package:flutter/material.dart';

class CreatePostFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This Floating Action Button is what allows users to create new posts:
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepOrangeAccent,
      onPressed: () {
        Navigator.pushNamed(context, '/create_post');
      },
    );
  }
}
