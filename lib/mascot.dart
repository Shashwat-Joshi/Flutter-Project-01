import 'package:flutter/material.dart';

class Mascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 0.0)),
          Text(
            "MASCOT",
            style:
                TextStyle(color: Colors.white, decoration: TextDecoration.none),
          ),
          Padding(padding: EdgeInsets.only(top: 80.0)),
          Image(
            image: AssetImage("images/string.gif"),
          ),
        ],
      ),
    );
  }
}
