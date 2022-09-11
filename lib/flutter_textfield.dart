// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  //runapp
  runApp(const AdeEntryWidget());
}

//Entry Widget
class AdeEntryWidget extends StatelessWidget {
  const AdeEntryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return materialApp
    return MaterialApp(
      title: "Ade Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AdeHomePage(),
    );
  }
}

//AdeHomePage
class AdeHomePage extends StatefulWidget {
  const AdeHomePage({Key? key}) : super(key: key);

  @override
  State<AdeHomePage> createState() => _AdeHomePageState();
}

class _AdeHomePageState extends State<AdeHomePage> {
  //scaffoldkey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //usernamecontroller
  final TextEditingController _usernameController = TextEditingController();
  //passwordcontroller
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ade Application"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  labelText: "User Name",
                  hintText: "Enter User Name",
                ),
              ),
            ),
            //password
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  labelText: "Password",
                  hintText: "Enter Password",
                ),
              ),
            ),
            //button
            Padding(
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  var username = _usernameController.text;
                  var password = _passwordController.text;
                  print("username: " + username + " password: " + password);
                },
                child: Text("Login"),
              ),
            ),
          ],
        ));
  }
}
