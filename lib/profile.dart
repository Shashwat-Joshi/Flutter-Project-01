import 'package:flutter/material.dart';
import 'picture.dart';

class Profile extends StatefulWidget {
  final int i;
  final List usersData;
  Profile({
    Key key,
    @required this.i,
    this.usersData,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("${widget.usersData[widget.i]['name']['first']}'s Profile"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(top: 50.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 5.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Picture(
                        usersData: widget.usersData,
                        i: widget.i,
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                    widget.usersData[widget.i]['picture']['large'],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color(0xFF313896),
                  // color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Name"),
                subtitle: Text(
                  widget.usersData[widget.i]['name']['first'] +
                      " " +
                      widget.usersData[widget.i]['name']['last'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(
                  Icons.wc,
                  color: Color(0xFF00D7FF),
                  // color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Gender"),
                subtitle: Text(
                  widget.usersData[widget.i]['gender'] == 'female'
                      ? "Female"
                      : "Male",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Color(0xFFFAEBD7),
                  // color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Email"),
                subtitle: Text(
                  widget.usersData[widget.i]['email'],
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(
                  Icons.portrait,
                  color: Colors.lightGreen,
                  // color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Age"),
                subtitle: Text(
                  "${widget.usersData[widget.i]['dob']['age']}",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  // color: Colors.lightGreen,
                  color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Phone no."),
                subtitle: Text(
                  "${widget.usersData[widget.i]['phone']}",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.pink,
                  // color: Color(0xFF7E0CEF),
                  size: 30.0,
                ),
                title: Text("Address"),
                subtitle: Text(
                  "${widget.usersData[widget.i]['location']['city']}, ${widget.usersData[widget.i]['location']['state']}, ${widget.usersData[widget.i]['location']['country']}",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
