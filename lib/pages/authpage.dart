import 'package:chatapp/logs/login.dart';
import 'package:chatapp/logs/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffFF9966), Color(0xffff5e62)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white)),
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                  child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                      splashColor: Colors.white,
                      onTap: () {
                        login(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 16,
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)),
                      )),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white)),
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      splashColor: Colors.white,
                      onTap: () {
                        signup(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 16,
                        child: Text("Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
