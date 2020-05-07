import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String name, email, mobile, lname;
  UserProfile({
    Key key,
    @required this.name,
    this.email,
    this.mobile,
    this.lname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF9F32B2),
        title: Text("Profile"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Card(
        margin: EdgeInsets.all(25.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              alignment: Alignment.bottomRight,
              image: AssetImage("images/profile_back.png"),
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 70.0)),
              Card(
                elevation: 10.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  radius: 55.0,
                  child: Text(
                    "${this.name[0].toUpperCase()}${this.lname.toUpperCase()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 60.0)),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF313896),
                    size: 27.0,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text(this.name),
              ),
              Padding(padding: EdgeInsets.only(bottom: 18.0)),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Icon(
                    Icons.email,
                    color: Color(0xFF313896),
                    size: 27.0,
                  ),
                ),
                title: Text("Email"),
                subtitle: Text(this.email),
              ),
              Padding(padding: EdgeInsets.only(bottom: 18.0)),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Icon(
                    Icons.phone,
                    color: Color(0xFF313896),
                    size: 27.0,
                  ),
                ),
                title: Text("Phone no."),
                subtitle: Text(this.mobile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
