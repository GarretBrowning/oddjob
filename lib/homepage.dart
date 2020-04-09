import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final List<MenuTabs> _tabs = [
    MenuTabs(title: 'Browse Posts', icon: Icon(Icons.find_in_page)),
    MenuTabs(title: 'My Posts', icon: Icon(Icons.contacts)),
    MenuTabs(title: 'Settings', icon: Icon(Icons.settings)),
  ];
  MenuTabs _menuTabsHandler;
  TabController _tabController;

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

  // DELETE This:
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          width: 3, //                   <--- border width here
      ),

    );
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

          // Will need to separate the children into a separate file:
          // EXAMPLE FOR NOW:
          children: <Widget>[
            Center(
            child: Card(
                margin: const EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                elevation: 15.0,
                child: Container(
                    height: 140,
//                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.album),
                            title: Text('Looking For House Painter'),
                            subtitle: Text(
                                '[Ad] [Housework] [Painting]'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text(r'$150'),
                                onPressed: () {
                                  /* ... */
                                },
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.favorite),
                                textColor: Colors.red, // Try for differentiation of Text/icon colour
                                label: Text('37'),
                                onPressed: () {
                                  /* ... */
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                )
            )
            ),

            // Start of Other Tab Pages:
            Center(child: Text('My Posts', style: Theme.of(context).textTheme.display1,)),
            Center(child: Text('Settings', style: Theme.of(context).textTheme.display1,))
          ],
        ),

        //This Floating Action Button is what allows users to create new posts:
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () {
            Navigator.pushNamed(context, '/create_post');
            },
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