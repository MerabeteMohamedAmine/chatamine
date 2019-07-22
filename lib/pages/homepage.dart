import 'package:chatapp/models/chats.dart';
import 'package:chatapp/models/contacts.dart';
import 'package:chatapp/models/profile.dart';
import 'package:chatapp/utils/firefunctions.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xff12c2e9),
          leading: Icon(Icons.accessibility),
          title: Text("Home"),
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(text: "Chats"),
              new Tab(text: "Contacts"),
              new Tab(
                text: "Profile",
              )
            ],
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (value){
                if(value==4){
                  FireFunctions().logOut();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('a'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('a'),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('a'),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('signout'),
                    value: 4,
                  ),
                ];
              },
            )
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new ChatsScreen(),
            new ContactsScreen(),
            new ProfileScreen(),
          ],
        ));
  }
}
