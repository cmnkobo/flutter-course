// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdeloginPage extends StatefulWidget {
  const AdeloginPage({Key? key}) : super(key: key);

  @override
  State<AdeloginPage> createState() => _AdeloginPageState();
}

class _AdeloginPageState extends State<AdeloginPage> {
  //email controller
  final emailController = TextEditingController();
  //password controller
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to Comment"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text("Login to Comment",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 20,
            ),
            //useremail
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    //border color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Email",
                    labelText: 'Email'),
              ),
            ),
            //password
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    //border color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Password",
                    labelText: 'Password'),
              ),
            ),
            //login button
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  //get email value
                  var email = emailController.text;
                  //get password value
                  var password = passwordController.text;
                  //check if email and password is empty
                  if (email.isEmpty || password.isEmpty) {
                    //show error message
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Email and Password cannot be empty"),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    //process login
                    processLogin(email, password).then((value) {
                      //check if login is successful
                      if (value) {
                        //close page
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                child: Text("Sign in", style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //process login
  processLogin(email, password) async {
    //dio post request
    var dio = Dio();
    //post data
    var data = {"email": email, "password": password};
    //use formdata to send data
    var formData = FormData.fromMap(data);
    //post request
    var response =
        await dio.post("${AdeAPI().baseurl}api/user_login", data: formData);
    //check if response is successful
    if (response.data["code"] == 200) {
      //shared preferences
      //save user data
      final prefs = await SharedPreferences.getInstance();
      //encode userdata
      var userData = response.data;
      //encode userdata
      var encodedata = jsonEncode(userData);
      //save userdata
      prefs.setString("userdetail", encodedata);
      //show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful"),
      ));
      return true;
    } else {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.data["error"]),
        backgroundColor: Colors.red,
      ));
      return false;
    }
  }
}
