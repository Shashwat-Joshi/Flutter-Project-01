import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name, email, mobile;
  int i;
  GlobalKey<FormState> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // KEYBOARD ISSUE
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50.0),
            margin: EdgeInsets.all(20.0),
            height: 830.0,
            child: Form(
              key: key,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      alignment: Alignment.bottomRight,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5), BlendMode.dstATop),
                      image: AssetImage("images/login.png"),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 55.0),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0XFF9F32B2),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80.0),
                      ),
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.person,
                            size: 28.0,
                            color: Color(0xFF7E0CEF),
                          ),
                        ),
                        title: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Enter Name";
                            }
                          },
                          onSaved: (input) {
                            name = input;
                          },
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Color(0xFF7E0CEF),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                      ),
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.email,
                            size: 28.0,
                            color: Colors.pink,
                          ),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Enter email";
                            }
                          },
                          onSaved: (input) => email = input,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                      ),
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.phone,
                            size: 28.0,
                            color: Color(0xFF00D7FF),
                          ),
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Enter phone no.";
                            }
                          },
                          onSaved: (input) => mobile = input,
                          decoration: InputDecoration(
                            labelText: "Phone no.",
                            labelStyle: TextStyle(
                              color: Color(0xFF00D7FF),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                      ),
                      AvatarGlow(
                        endRadius: 80,
                        glowColor: Color(0XFF9F32B2),
                        child: ButtonTheme(
                          buttonColor: Colors.white,
                          height: 100.0,
                          shape: CircleBorder(),
                          child: RaisedButton(
                            elevation: 10.0,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Color(0XFF9F32B2),
                                fontSize: 15.0,
                              ),
                            ),
                            onPressed: () {
                              _nextScreen();
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
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
    );
  }

  _nextScreen() {
    if (key.currentState.validate()) {
      key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(
              name: name,
              email: email,
              mobile: mobile,
            );
          },
        ),
      );
    }
  }
}
