import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/entities/user.dart';
import 'package:line_icons/line_icons.dart';

class UserTail extends StatelessWidget {
  final User user;
  final GestureTapCallback onTap;

  const UserTail({Key key, this.user, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.4),
            borderRadius: BorderRadius.circular(18),
            ),
        child: user.imgUrl == "url"
            ? CircleAvatar(
                backgroundColor: Color(0xffff5e62),
                foregroundColor: Colors.white,
                child: Icon(LineIcons.user),
                //  Text(user.initiales,
                //     style: TextStyle(color: Color(0xff4e54c8))),
                maxRadius: 28,
              )
            : CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  user.imgUrl,
                ),
                maxRadius: 28,
              ),
      ),
      title: Text(user.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width / 20)),
      subtitle: Text(user.email,
          style: TextStyle(
              color: Colors.black.withOpacity(.6),
              fontSize: MediaQuery.of(context).size.width / 28)),
      trailing: Text(user.isActive,
          style: TextStyle(
              color: Colors.green,
              fontSize: MediaQuery.of(context).size.width / 26)),
      onTap: onTap,
    );
  }
}
