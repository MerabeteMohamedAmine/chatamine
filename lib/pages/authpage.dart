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
              colors: [Color(0xffFEAC5E),Color(0xffC779D0),Color(0xff4BC0C8)],
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter
          ),
        ),
        child: Column(
          children: <Widget>[
            Text("hello There.",style: TextStyle(color: Colors.white,fontSize: 50),),

            RaisedButton(
              elevation: 0,
              color: Colors.greenAccent,
              child: Text("LogIn",style: TextStyle(fontSize: 18)),
              onPressed: (){ 
                login(context);
              },
            ),
            RaisedButton(
             // shape: BoxShape.circle,
              elevation: 0,
              color: Colors.greenAccent,
              child: Text("SignUp",style: TextStyle(fontSize: 18)),
              onPressed: (){
                signup(context);
              },
            ),
            
          ],
        ),

      ),
      
    );
  }
}