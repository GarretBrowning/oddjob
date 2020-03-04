import 'package:flutter/material.dart';
import 'package:oddjob/login_page/login.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: themeData,
  ));
}

// BUILDING A MULTI-PAGE APPLICATION WITH DART's FLUTTER MOBILE FRAMEWORK (Instructional video, Youtube)
final ThemeData themeData = ThemeData(
  canvasColor: Colors.white70,
  accentColor: Colors.black
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _tabs = ["Home", "My Posts", "Report"];

  @override void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("OddJob"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.find_in_page)),
              Tab(icon: Icon(Icons.contacts)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(child: Text("Browse Posts", style: Theme.of(context).textTheme.display1,)),
            Center(child: Text("My Posts", style: Theme.of(context).textTheme.display1,)),
            Center(child: Text("Settings", style: Theme.of(context).textTheme.display1,))
          ],
        )
    );
  }
}


