import 'package:flutter/material.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/signup.dart';
import 'package:line_icons/line_icons.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffFF9966), Color(0xffff5e62)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 8, left: 40, right: 40),
          // color: Color(0xFF383645),
          padding: MediaQuery.of(context).padding,
          child: Column(
            //work with design later
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(LineIcons.comments_o,color:Colors.white,size: MediaQuery.of(context).size.width/1.8,),
                      Text(
                        "Welcome To Mavrick!",
                        style: TextStyle(color: Colors.white,fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                        child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                        fontFamily: "Baloo",fontSize: 20)),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.white)),
                        child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                        fontFamily: "Baloo",fontSize: 20)),
                              )),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    //  Scaffold(
    //   body: Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: [Color(0xff1CD8D2), Color(0xff93EDC7)],
    //             begin: Alignment.topLeft,
    //             end: Alignment.bottomRight),
    //       ),
    //       child: PageView(
    //         // physics: NeverScrollableScrollPhysics(),
    //         controller: _controller,
    //         children: <Widget>[Login(), Login()],
    //       )),
    // );
  }
}
