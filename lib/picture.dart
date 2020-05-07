import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  final List usersData;
  final int i;
  Picture({
    Key key,
    @required this.usersData,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image(
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        filterQuality: FilterQuality.high,
        image: NetworkImage(
          this.usersData[this.i]['picture']['large'],
        ),
      ),
    );
  }
}
