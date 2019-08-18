import 'package:chatapp/Tabs/chats.dart';
import 'package:chatapp/Tabs/contacts.dart';
import 'package:chatapp/Tabs/profile.dart';
import 'package:chatapp/utils/firefunctions.dart';
import 'package:flutter/material.dart';
// import 'package:chatapp/main.dart';
import 'package:extended_tabs/extended_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String id;
  @override
  void initState() {
    super.initState();

    FireFunctions().myId().then((id) {
      setState(() {
        this.id = id;
      });
    });

    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireFunctions().firebaseAuth.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xffFF9966),
                elevation: 1,
                // leading: Icon(Icons.accessibility),
                title: Text("Chats"),
                bottom: new TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    new Tab(text: "Home"),
                    new Tab(text: "Contacts"),
                    new Tab(text: "Profile",)
                  ],
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 3) {
                        FireFunctions().logOut();
                      } else if (value == 2) {
                      } else {}
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Change Password'),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text('Delete Account'),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text('Signout'),
                          value: 3,
                        ),
                      ];
                    },
                  )
                ],
              ),
              body: new ExtendedTabBarView(
                cacheExtent: 2,
                controller: _tabController,
                children: <Widget>[
                  new ChatsScreen(id: id),
                  new ContactsScreen(id: id),
                  new ProfileScreen(id: id),
                ],
              ));
        } else {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                // backgroundColor: new Color(0xff12c2e9),
                elevation: 1,
                // leading: Icon(Icons.accessibility),
                title: Text("Loading.."),
                bottom: new TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black.withOpacity(.6),
                  tabs: <Widget>[
                    new Tab(text: "Home"),
                    new Tab(text: "Contacts"),
                    new Tab(text: "Profile",)
                  ],
                ),
              ),
              body: new ExtendedTabBarView(
                cacheExtent: 2,
                controller: _tabController,
                children: <Widget>[
                  Container(
                    child: CircularProgressIndicator(),
                  ),
                  Container(
                    child: CircularProgressIndicator(),
                  ),
                  Container(
                    child: CircularProgressIndicator(),
                  )
                ],
              ));
        }
      },
    );
  }
}
