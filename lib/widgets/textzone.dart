import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chatapp/entities/user.dart';
import 'package:chatapp/util/firebaseUtils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';


class TextZone extends StatefulWidget {
  final User partner;
  final String id;

  const TextZone({Key key, this.partner, this.id}) : super(key: key);

  @override
  _TextZoneState createState() => _TextZoneState();
}

class _TextZoneState extends State<TextZone> {
  TextEditingController _textEditingController;
  User me;

  @override
  void initState() {
    _textEditingController = new TextEditingController();

    FirebaseUtils().getUser(widget.id).then((user) {
      setState(() {
        me = user;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: IconButton(
              icon: Icon(
                LineIcons.photo,
                color: Color(0xffff5e62).withOpacity(.8)
              ),
              onPressed: () {
                takePicture(ImageSource.gallery);
              },
            ),
          ),
          Expanded(
            child: Container(
              child: TextField(
                controller: _textEditingController,
                cursorWidth: 1,
                cursorColor: Colors.grey,
                style: TextStyle(
                  color: Colors.black.withOpacity(.8),
                    // fontFamily: 'product'
                    ),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(
                        10), //--------------------------------------------
                    hintText: 'Aa',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(.5),
                      // fontFamily: 'product'
                    ),
                    fillColor: Color.fromRGBO(252, 252, 252, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffff5e62).withOpacity(.2),
                         width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffff5e62).withOpacity(.2),
                         width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Color(0xffff5e62).withOpacity(.8),
              ),
              onPressed: _sendButtonPressed(),
            ),
          )
        ],
      ),
    );
  }

  _sendButtonPressed() {
    if (_textEditingController.text != null &&
        _textEditingController.text != "") {
      String text = _textEditingController.text;
      FirebaseUtils().sendMessage(widget.partner, me, text, null);
      _textEditingController.clear();
      // FocusScope.of(context).requestFocus(new FocusNode());
    } else {
      print("Texte vide ou null");
    }
  }

  Future<void> takePicture(ImageSource source) async {
    File file = await ImagePicker.pickImage(
        source: source, maxWidth: 1000.0, maxHeight: 1000.0);
    String date = new DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseUtils()
        .savePicture(
            file, FirebaseUtils().storage_messages.child(widget.id).child(date))
        .then((string) {
      FirebaseUtils().sendMessage(widget.partner, me, null, string);
    });
  }
}
