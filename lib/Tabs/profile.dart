import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/tabs/deff.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/entities/user.dart';
import 'package:chatapp/util/firebaseUtils.dart';
import 'package:chatapp/widgets/editpassword.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  final String id;

  const Profile({Key key, this.id}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user;

  @override
  void initState() {
    FirebaseUtils().getUser(widget.id).then((onValue) {
      setState(() {
        user = onValue;
      });
      //  print(user.imgUrl);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: FutureBuilder(
        future: FirebaseUtils().getUser(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                GestureDetector(
                  onTap: () => _takePicture(ImageSource.gallery),
                  child: Center(
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(
                              color: Color(0xffff5e62),
                              width: 2,
                            )),
                        child: user.imgUrl == "url"
                            ? CircleAvatar(
                                backgroundColor: Color(0xffff5e62),
                                child: Icon(
                                  LineIcons.user,
                                  color: Colors.white,
                                  size: 80,
                                ),
                                //  Text(user.initiales,
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize:
                                //             MediaQuery.of(context).size.width /
                                //                 5)),
                                radius: MediaQuery.of(context).size.width / 4,
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    CachedNetworkImageProvider(user.imgUrl),
                                radius: MediaQuery.of(context).size.width / 4,
                              )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                // Divider(
                //   color: Colors.white.withOpacity(.2),
                //   height: 1.5,
                // ),
                Center(
                  child: Container(
                    child: Text(
                      user.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 16),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text(
                      user.email,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontSize: MediaQuery.of(context).size.width / 22),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 22),
                ),
                Divider(
                  color: Color(0xffff5e62).withOpacity(.2),
                  height: 1.5,
                ),
                // Container(
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       child: Icon(LineIcons.bell),
                //       maxRadius: 28,
                //       backgroundColor: Colors.indigo.withOpacity(.6),
                //       foregroundColor: Colors.white,
                //     ),
                //     title: Text("Notifications",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: MediaQuery.of(context).size.width / 20)
                //         // style: TextStyle(fontSize: 20, color: KColors.third),
                //         ),
                //     subtitle: Text("Active or away",
                //         style: TextStyle(
                //             color: Colors.white.withOpacity(.6),
                //             fontSize: MediaQuery.of(context).size.width / 28)
                //         // style: TextStyle(fontSize: 18, color: KColors.fourth)
                //         ),
                //     trailing: Switch(
                //       value: FirebaseUtils.temp,
                //       activeColor: Colors.greenAccent,
                //       inactiveThumbColor: Colors.grey,
                //       onChanged: (value) async {
                //         if (value) {
                //           FirebaseUtils.temp=value;
                //           await FirebaseUtils()
                //               .base_user
                //               .child(widget.id)
                //               .update({"isActive": "Active"});
                //         } else {
                //           FirebaseUtils.temp=value;
                //           await FirebaseUtils()
                //               .base_user
                //               .child(widget.id)
                //               .update({"isActive": ""});
                //         }
                //       },
                //     ),
                //   ),
                // ),
                Container(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Deff(
                                    id: widget.id,
                                  )));
                    },
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      // backgroundColor: Colors.redAccent,
                      // foregroundColor: Colors.white,
                      // radius: 28,
                      child: Icon(
                        LineIcons.edit,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(LineIcons.info_circle, color: Colors.grey),
                    title: Text("Deffuse",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 20)),
                    subtitle: Text("Deffuse messages lol",
                        style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                            fontSize: MediaQuery.of(context).size.width / 28)),
                  ),
                ),
                Container(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              new EditPassword());
                    },
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      // backgroundColor: Colors.redAccent,
                      // foregroundColor: Colors.white,
                      // radius: 28,
                      child: Icon(
                        LineIcons.key,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(LineIcons.info_circle, color: Colors.grey),
                    title: Text("Change Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 20)),
                    subtitle: Text("press to update password",
                        style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                            fontSize: MediaQuery.of(context).size.width / 28)),
                  ),
                ),
                Container(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  "Delete account?",
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text("Cancel",style: TextStyle(color: Colors.black),),
                                      onPressed: () => Navigator.pop(context)),
                                  FlatButton(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Color(0xffff5e62)),
                                      ),
                                      onPressed: () => FirebaseUtils()
                                              .deleteUser(widget.id)
                                              .then((onValue) {
                                            Navigator.pop(context);
                                          }).catchError((onError) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    SimpleDialog(
                                                      title: Text(
                                                          "Somthig went wrong!"),
                                                      children: <Widget>[
                                                        Text(
                                                            "Could not delete account..")
                                                      ],
                                                    ));
                                          })),
                                ],
                              ));
                    },
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      // backgroundColor: Colors.redAccent,
                      // foregroundColor: Colors.white,
                      // radius: 28,
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(LineIcons.info_circle, color: Colors.grey),
                    title: Text("Delete Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 20)),
                    subtitle: Text("delete all your informations",
                        style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                            fontSize: MediaQuery.of(context).size.width / 28)),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Loading profile..",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _takePicture(ImageSource source) async {
    File image;
    image = await ImagePicker.pickImage(
        source: source, maxWidth: 500.0, maxHeight: 500.0);
    FirebaseUtils()
        .savePicture(image, FirebaseUtils().storage_users.child(widget.id))
        .then((string) async {
      await FirebaseUtils().base_user.child(user.id).update({"imgUrl": string});
      // Map map = user.toMap();
      // map["imgUrl"] = string;
      // FirebaseUtils().addUser(user.id, map);
      FirebaseUtils().getUser(widget.id).then((onValue) {
        setState(() {
          user = onValue;
        });
        //  print(user.imgUrl);
      });
    });
  }
}
