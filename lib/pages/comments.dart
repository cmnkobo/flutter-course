// ignore_for_file: no_logic_in_create_state, use_build_context_synchronously

import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdeBlogComment extends StatefulWidget {
  final commentArray;
  final postId;
  const AdeBlogComment({Key? key, this.commentArray, this.postId})
      : super(key: key);

  @override
  State<AdeBlogComment> createState() =>
      _AdeBlogCommentState(commentArray: commentArray, postId: postId);
}

class _AdeBlogCommentState extends State<AdeBlogComment> {
  dynamic commentArray;
  dynamic postId;
  _AdeBlogCommentState({this.commentArray, this.postId});

  //formKey
  final formKey = GlobalKey<FormState>();
  //commentController
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Container(
        child: CommentBox(
          userImage: "https://garverins.com/wp-content/uploads/user.png",
          labelText: 'Write a comment...',
          withBorder: true,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () async {
            //get data from shared preferences
            final prefs = await SharedPreferences.getInstance();
            //get string
            var userdetail = prefs.getString('userdetail');
            //decode userdetail
            var userdetaildecoded = jsonDecode(userdetail!);
            print(userdetaildecoded["user_details"]);
            if (formKey.currentState!.validate()) {
              // print(commentController.text);
              //send comment to server
              submitComment(userdetaildecoded["user_details"]["id"],
                  commentController.text, postId);
            } else {
              // print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: commentChild(commentArray),
        ),
      ),
    );
  }

  //comment child
  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  // print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ),
              title: Text(
                data[i]['user'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['comment']),
            ),
          )
      ],
    );
  }

  //submit comment
  submitComment(user_id, message, post_id) async {
    //use dio
    var dio = Dio();
    //send data to server
    var data = {"user_id": user_id, "message": message, "post_id": post_id};

    //convert to formdata
    var formData = FormData.fromMap(data);

    //send data to server
    var response = await dio.post(
        "http://10.0.2.2:8888/php_beginner/api/add_comment",
        data: formData);
    if (response.data["code"] == 200) {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Comment Added, waiting admin approval"),
        backgroundColor: Colors.green,
      ));
      commentController.clear();
      FocusScope.of(context).unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Unable to add comment"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
