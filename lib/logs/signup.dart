import 'package:chatapp/utils/firefunctions.dart';
import 'package:flutter/material.dart';


GlobalKey<FormState> formKey = GlobalKey<FormState>();
String password, email, name;

void signup(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          elevation: 1,
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          title: Text(
            "Signup",
            style: TextStyle(fontFamily: "Baloo", fontSize: 28,color: Colors.black),
          ),
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 4),
                    child: TextFormField(
                      onSaved: (input) {
                      name = input.trim();
                      },
                      validator: (input) {
                        if (input.isEmpty) return 'Need a name';
                      },
                      cursorColor: Color(0xFF383645),
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(240, 250, 250, .8),
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 12, right: 6),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: TextFormField(
                      onSaved: (input) {
                        email = input.trim();
                      },
                      validator: (input) {
                        if (input.isEmpty) return 'need an email';
                      },
                      cursorColor: Color(0xFF383645),
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(240, 250, 250, .8),
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 12, right: 6),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: TextFormField(
                      onSaved: (input) {
                        password = input;
                      },
                      validator: (input) {
                        if (input.length < 6) return 'More Then 6 characters';
                      },
                      cursorColor: Color(0xFF383645),
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(240, 250, 250, .8),
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 12, right: 6),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              elevation: 0,
              textColor: Colors.white,
              color: Color(0xff12c2e9),
              child: Text("Done", style: TextStyle(fontFamily: "Baloo")),
              onPressed: () {
                _signup(context);
              },
            ),
          ],
        );
      });
}

Future<void> _signup(BuildContext context) async {
  BuildContext dialogCtx;
  if (formKey.currentState.validate()) {
    formKey.currentState.save();
    showDialog(
        context: context,
        builder: (dcontext) {
          dialogCtx = dcontext;
          return SimpleDialog(
            title: Text("Wait please"),
            titlePadding: EdgeInsets.all(12),
            contentPadding: EdgeInsets.all(16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              )
            ],
          );
        });

    FireFunctions().signup(email, password, name).then((onValue) {
      Navigator.of(dialogCtx).pop(true);
      Navigator.pop(context);
    }).catchError((onError) {
      Navigator.of(dialogCtx).pop(true);
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              title: Text("Error"),
              children: <Widget>[
                Text("Failed to Sign you up with these email & password"),
              ],
            );
          });
    });
  }
}
