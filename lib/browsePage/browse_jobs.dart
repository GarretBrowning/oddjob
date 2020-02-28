import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oddjob/postPage/post_jobs.dart';
import 'package:oddjob/main.dart';
import 'dart:async';
import 'package:oddjob/models/post.dart';
import 'package:oddjob/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class BrowseJobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BrowseJobPageState();
  }
}

class BrowseJobPageState extends State<BrowseJobPage> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Post> postList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(postList == null) {
      postList = List<Post>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Find your OddJob!"),
      ),
      body: getPostListView(),

      floatingActionButton: FloatingActionButton( // ADD ANOTHER F.A.B for homepage
        onPressed: () {
          debugPrint('FAB clicked');
          Navigator.push(
              context,
             MaterialPageRoute(builder: (context) => PostJobPage()),
          );
        },
        tooltip: 'Post an OddJob',
        child: Icon(Icons.send),
      ),
    );
  }

  ListView getPostListView() {
     TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

     return ListView.builder(
       itemCount: count,
       itemBuilder: (BuildContext context, int position) {
         return Card(
           color: Colors.white,
           elevation: 2.0,

           child: ListTile(
             leading: CircleAvatar(
               backgroundColor: getPriorityColor(this.postList[position].priority),
               child: getPriorityIcon(this.postList[position].priority),
             ),

             title: Text(this.postList[position].title, style: titleStyle,),
             subtitle: Text(this.postList[position].date),

             trailing: GestureDetector(
               child: Icon(Icons.delete, color: Colors.grey,),
               onTap: (){
                 _delete(context, postList[position]);
               },
             ),
             // This function allows user to interact with post onTap. In future, it will route to a 'accept job page'
             onTap: (){
                debugPrint("ListTile Tapped");
             },
           ),
         );
       },
     );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  // Deletes the post
  void _delete(BuildContext context, Post post) async {

    int result = await databaseHelper.deletePost(post.id);
    if(result != 0) {
      _showSnackBar(context, 'Post Deleted Succesfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Post>> postListFuture = databaseHelper.getPostList();
      postListFuture.then((postList) {
        setState(() {
          this.postList = postList;
          this.count = postList.length;
        });
      });
    });
  }
}