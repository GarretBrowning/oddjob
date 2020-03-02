import 'package:flutter/material.dart';
import 'package:oddjob/postPage/post_jobs.dart';
import 'package:oddjob/main.dart';

class BrowseJobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BrowseJobPageState();
  }
}

class BrowseJobPageState extends State<BrowseJobPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find your OddJob!"),
        leading: IconButton(icon: Icon(
          Icons.arrow_back
          ),
          onPressed: () {
            // Implement a way for the back arrow to route to main menu
          },
        ),
      ),
      body: getPostListView(),

      floatingActionButton: FloatingActionButton( // ADD ANOTHER F.A.B for homepage
        onPressed: () {
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
     TextStyle titleStyle = Theme.of(context).textTheme.subhead; // HAD TO CHANGE THIS FROM subtitle1 (Garret)

     return ListView.builder(
       itemCount: count,
       itemBuilder: (BuildContext context, int position) {
         return Card(
           color: Colors.white,
           elevation: 2.0,

           child: ListTile(
             leading: CircleAvatar(
               backgroundColor: Colors.yellow,
               child: Icon(Icons.keyboard_arrow_right),
             ),

             title: Text('Dummy Title', style: titleStyle,),
             subtitle: Text('Dummy Date'),
             trailing: Icon(Icons.delete, color: Colors.grey,),

             onTap: (){}, // This function allows user to interact with post onTap. In future, it will route to a 'accept job page'

           ),
         );
       },
     );
  }
}