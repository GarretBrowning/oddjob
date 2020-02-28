import 'package:flutter/material.dart.';
import 'package:oddjob/login_page/login.dart';
import 'package:oddjob/browsePage/browse_jobs.dart';
import 'package:oddjob/postPage/post_jobs.dart';


void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: themeData,
  ));
}

// BUILDING A MULTI-PAGE APPLICATION WITH DART's FLUTTER MOBILE FRAMEWORK (Instructional video, Youtube)
final ThemeData themeData = ThemeData(
  canvasColor: Colors.white70,
  accentColor: Colors.black,
);

// MainMenu Class
class MainMenu extends MaterialPageRoute<Null> {
  MainMenu() : super(builder: (BuildContext context) {

     return Scaffold(

         body: Column(children: <Widget>[
           Container(height: 280.0,), // Top of Screen padding, pushes buttons downwards

           Row( // TEXT ROW 1
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Text(
                 "Browse OddJobs",
                 style: TextStyle(color: Colors.blueAccent, fontSize: 25),
               ),
               Text(
                 "Post An OddJob",
                 style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
               ),
             ],
           ),

           Row( // BUTTON ROW 1
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container(
                 color: Colors.orange,
                 margin: EdgeInsets.all(25.0),
                 child: RaisedButton(
                   onPressed: () {
                     Navigator.push(
                       context,  // this material page route links the pages
                       MaterialPageRoute(builder: (context) => BrowseJobPage()),
                     );
                   },
                 ),
               ),
               Container(
                 color: Colors.blue,
                 margin: EdgeInsets.all(25.0),
                 child: RaisedButton(
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => PostJobPage()),
                     );
                   },
                 ),
               ),
             ],
           ),

           Row( // TEXT ROW 2
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Text(
                 "Manage Your Account",
                 style: TextStyle(color: Colors.purpleAccent, fontSize: 25),
               ),
               Text(
                 "Help/Support",
                 style: TextStyle(color: Colors.greenAccent, fontSize: 25),
               ),
             ],
           ),

           Row( // BUTTON ROW 2
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   color: Colors.purple,
                   margin: EdgeInsets.all(25.0),
                   child: RaisedButton(
                     onPressed: () {
                       Navigator.push(context, ManageAccountPage());
                     },
                   ),
                 ),
                 Container(
                   color: Colors.green,
                   margin: EdgeInsets.all(25.0),
                   child: RaisedButton(
                     onPressed: () {
                       Navigator.push(context, HelpSupportPage());
                     },
                   ),
                 ),]
           ),
         ])
     );
  });
}


// ManageAccountPage Class
class ManageAccountPage extends MaterialPageRoute<Null> {
  ManageAccountPage() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Your Account"),
        backgroundColor: Theme
            .of(context)
            .accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MainMenu());
            },
            child: Text("Go Home! (From Managing Your Account)"),
          )
      ),
    );
  });
}


// HelpSupportPage Class
class HelpSupportPage extends MaterialPageRoute<Null> {
  HelpSupportPage() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help/Support!"),
        backgroundColor: Theme
            .of(context)
            .accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MainMenu());
            },
            child: Text("Go Home! (From Help/Support)"),
          )
      ),
    );
  });
}


