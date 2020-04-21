import 'package:flutter/material.dart';
import 'package:oddjob/browsePage/browse_posts.dart';
import 'package:provider/provider.dart';
import 'models/posts_list._model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  MenuTabs _menuTabsHandler;
  TabController _tabController;

  final List<MenuTabs> _tabs = [
    MenuTabs(title: 'Browse Posts', icon: Icon(Icons.find_in_page)),
    MenuTabs(title: 'My Posts', icon: Icon(Icons.contacts)),
    MenuTabs(title: 'Settings', icon: Icon(Icons.settings)),
  ];
  final Widget browsePostsPage = BrowsePostsPage();

  @override
  // Initializing the state:
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _menuTabsHandler = _tabs[0];
    _tabController.addListener(_handleSelected);
  }

  // Function to handle the selected tab:
  void _handleSelected() {
    setState(() {
      _menuTabsHandler = _tabs[_tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                  child: Text(_menuTabsHandler.title),
              ),
              backgroundColor: Colors.deepOrangeAccent,
              bottom: TabBar(
                controller: _tabController,
                tabs: <Tab>[
                  Tab(icon: _tabs[0].icon,),
                  Tab(icon: _tabs[1].icon,),
                  Tab(icon: _tabs[2].icon,),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              /// Will need to separate the children into a separate file:
              /// EXAMPLE FOR NOW:
              children: <Widget>[
                Container(child: browsePostsPage),
                Center(child: Text('My Posts', style: Theme.of(context).textTheme.display1,)),
                Center(child: Text('Settings', style: Theme.of(context).textTheme.display1,))
              ],
            ),
        );
  }
}

// Created our own Tabs to take in a title and an icon for the AppBar:
class MenuTabs {
  final String title;
  final Icon icon;
  MenuTabs({this.title, this.icon});
}