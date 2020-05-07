import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile.dart';
import 'mascot.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'userProfile.dart';

class HomePage extends StatefulWidget {
  final String name, email, mobile;
  HomePage({
    Key key,
    @required this.name,
    this.email,
    this.mobile,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  List usersData;
  bool isLoading = true;
  bool tooMuchTime = false;
  int time = 10, index;
  String lname = " ";

  lastname() {
    setState(() {
      if (widget.name.contains(" ") &&
          widget.name.indexOf(" ") == widget.name.length - 1) {
        index = widget.name.indexOf(" ") + 1;
        lname = widget.name[index];
      } else if (widget.name.length >= 2) {
        lname = widget.name[1];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getJSONdata();
    this.lastname();
    this.timer();
  }

  Future getJSONdata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    List data = json.decode(response.body)["results"];
    setState(() {
      usersData = data;
      isLoading = false;
    });
  }

  timer() {
    Timer(Duration(seconds: time), () {
      if (isLoading) {
        setState(() {
          this.tooMuchTime = true;
          time += 5;
        });
      }
    });
  }

  _showDialog() {
    Timer(Duration(milliseconds: 50), () {
      return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              "Connection timed out !!",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              color: Colors.red,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Reload"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _reload();
                  setState(() {
                    this.time = this.time + 5;
                  });
                },
              )
            ],
          );
        },
      );
    });
  }

  _reload() {
    setState(() {
      this.isLoading = true;
      this.tooMuchTime = false;
    });
    this.timer();
    this.getJSONdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color(0XFF9F32B2)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Text(
            "RANDOM USERS API",
            style: TextStyle(color: Color(0XFF9F32B2)),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => UserProfile(
                      name: widget.name,
                      email: widget.email,
                      mobile: widget.mobile,
                      lname: lname,
                    ),
                  ),
                );
              },
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0XFF2E22AC), Color(0xFFE34C9D)],
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                      "${widget.name[0].toUpperCase()}${this.lname.toUpperCase()}"),
                ),
                accountName: Text(widget.name.toUpperCase()),
                accountEmail: Text(widget.email),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.developer_mode,
                color: Colors.grey[700],
              ),
              title: Text(
                "Mascot",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Mascot(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              isLoading
                  ? Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 85.0),
                        height: 300.0,
                        width: 300.0,
                        child: !tooMuchTime
                            ? Image.asset(
                                "images/circle_load.gif",
                              )
                            : _showDialog(),
                      ),
                    )
                  : ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                              height: 420.0,
                              width: 400.0,
                              child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      usersData == null ? 0 : usersData.length,
                                  itemBuilder: (BuildContext context, int i) =>
                                      Container(
                                    height: 420.0,
                                    width: 400.0,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 10.0, 5.0, 15.0),
                                      child: Card(
                                        elevation: 7.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Card(
                                              margin:
                                                  EdgeInsets.only(top: 50.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              elevation: 5.0,
                                              child: CircleAvatar(
                                                child: GestureDetector(
                                                  // TODO: onTap view Profile
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                        builder: (context) =>
                                                            Profile(
                                                          i: i,
                                                          usersData: usersData,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                radius: 70.0,
                                                backgroundImage: NetworkImage(
                                                  usersData[i]['picture']
                                                      ['large'],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 25.0),
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.person,
                                                  color: Color(0xFF313896),
                                                  // color: Color(0xFF7E0CEF),
                                                  size: 30.0,
                                                ),
                                                title: Text("Name"),
                                                subtitle: Text(
                                                  usersData[i]['name']
                                                          ['first'] +
                                                      " " +
                                                      usersData[i]['name']
                                                          ['last'],
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
                                                  usersData[i]['gender'] ==
                                                          'female'
                                                      ? "Female"
                                                      : "Male",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Center(
                child: AvatarGlow(
                  showTwoGlows: true,
                  shape: BoxShape.circle,
                  glowColor: Colors.deepPurple,
                  endRadius: 120.0,
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0XFF2E22AC), Color(0xFFE34C9D)]),
                    ),
                    child: MaterialButton(
                      elevation: 10.0,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.purple,
                      shape: CircleBorder(),
                      onPressed: () {
                        _reload();
                      },
                      child: Text(
                        "Reload",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25.0),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2AFCF9), Color(0xFFFAEBD7)],
                  ),
                ),
                height: 300.0,
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    '"This application is to understand and apply the use of API"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 70.0),
              ),
              Text("Desktop Version Coming soon",
                  style: GoogleFonts.raleway(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[600],
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Image(
                  image: AssetImage("images/mac.gif"),
                ),
              ),
              Center(
                child: Text(
                  "String Inc.",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
