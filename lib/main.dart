import 'package:flutter/material.dart.';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: themeData,
  ));
}

// BUILDING A MULTI-PAGE APPLICATION WITH DART's FLUTTER MOBILE FRAMEWORK (Instructional video, Youtube)
final ThemeData themeData = ThemeData(
  canvasColor: Colors.white70,
  accentColor: Colors.black,
);

// LoginPage of App
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MainMenu());
          },
          child: Text("Log In"),
        ),
      ),
    );
  }
}

// MainMenu Class
class MainMenu extends MaterialPageRoute<Null> {
  MainMenu() : super(builder: (BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 1.0,
        ),
         body: Column(children: <Widget>[
           Row(
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
           Row(
             //ROW 1
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container(
                 color: Colors.orange,
                 margin: EdgeInsets.all(25.0),
                 child: RaisedButton(
                   onPressed: () {
                     Navigator.push(context, BrowseJobPage());
                   },
                 ),
               ),
               Container(
                 color: Colors.blue,
                 margin: EdgeInsets.all(25.0),
                 child: RaisedButton(
                   onPressed: () {
                     Navigator.push(context, PostJobPage());
                   },
                 ),
               ),
             ],
           ),
           Row(
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
           Row( //ROW 2
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
                 ),
               ]),
         ]));
  });
}

// BrowseJobPage Class
class BrowseJobPage extends MaterialPageRoute<Null> {
  BrowseJobPage() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse OddJobs"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.push(context, MainMenu());
          },
          child: Text("Go Home! (From Browsing OddJobs)"),
        )
      ),
    );
  });
}
// PostJobPage Class
class PostJobPage extends MaterialPageRoute<Null> {
  PostJobPage() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post An OddJob!"),
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
            child: Text("Go Home! (From Posting An OddJob)"),
          )
      ),
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


