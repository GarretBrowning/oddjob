import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin { //Have Question about the SingleTickerProviderStateMixin
  TabController _tabController;

  //Could try to create custom keys later for organization/cleanup:
  final List<Widget> _tabs = [
    Tab(icon: Icon(Icons.find_in_page)),
    Tab(icon: Icon(Icons.contacts)),
    Tab(icon: Icon(Icons.settings)),
  ];

  @override void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("OddJob"),
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
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