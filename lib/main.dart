import 'package:chatapp/pages/authpage.dart';
import 'package:chatapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: Colors.transparent
    // systemNavigationBarDividerColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white,
          // accentColor: Color(0xff4e54c8),
          // canvasColor: Color(0xff4e54c8),
          // backgroundColor: Color(0xff4e54c8),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.white,
            labelStyle: TextStyle(fontFamily: 'baloo',color: Colors.white),
            unselectedLabelStyle: TextStyle(
                fontFamily: 'baloo', color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.white),
              color: Colors.white,
              textTheme: TextTheme(
                  body1: TextStyle(fontFamily: 'baloo',color: Colors.white),
                  body2: TextStyle(fontFamily: 'baloo',color: Colors.white),
                  title: TextStyle(fontFamily: 'baloo',color: Colors.white, fontSize: 32))),
          textTheme: TextTheme(
            body1: TextStyle(fontFamily: 'baloo'),
            body2: TextStyle(fontFamily: 'baloo'),
            button: TextStyle(fontFamily: 'baloo'),
            display1: TextStyle(fontFamily: 'baloo'),
            display2: TextStyle(fontFamily: 'baloo'),
            display3: TextStyle(fontFamily: 'baloo'),
            display4: TextStyle(fontFamily: 'baloo'),
            title: TextStyle(fontFamily: 'baloo'),
            subtitle: TextStyle(fontFamily: 'baloo'),
            caption: TextStyle(fontFamily: 'baloo'),
            headline: TextStyle(fontFamily: 'baloo'),
            overline: TextStyle(fontFamily: 'baloo'),
            subhead: TextStyle(fontFamily: 'baloo'),
          )),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Router(),
    );
  }
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.data != null)
          return HomePage();
        else
          return AuthPage();
      },
    );
  }
}
