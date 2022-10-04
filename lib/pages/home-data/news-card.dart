//create blog stateful
// ignore_for_file: avoid_init_to_null

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:ecommerce/pages/single-blog.dart';
import 'package:flutter/material.dart';

import 'news-card-list.dart';

class AdeBlogPage extends StatefulWidget {
  AdeBlogPage({Key? key}) : super(key: key);

  @override
  State<AdeBlogPage> createState() => _AdeBlogPageState();
}

class _AdeBlogPageState extends State<AdeBlogPage> {
  dynamic blogheader = null;
  dynamic blogbody = null;

  //oninit
  @override
  void initState() {
    super.initState();
    getBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //blog header
          blogheader != null
              ? InkWell(
                  onTap: () {
                    //goto blog detail
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AdeBlogDetail(blogdetail: blogheader)));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    //background image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(blogheader["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(.0),
                        ],
                      )),
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            blogheader["title"],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                height: 1.2,
                                fontWeight: FontWeight.w900),
                          )),
                    ),
                  ),
                )
              : const Center(
                  child: Padding(
                  padding: EdgeInsets.all(60.0),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )),

          //body
          blogbody != null
              ? Column(
                  children: [
                    for (var i = 0; i < blogbody.length; i++)
                      InkWell(
                        onTap: () {
                          //goto blog detail
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdeBlogDetail(blogdetail: blogbody[i])));
                        },
                        child: AdeBlogList().getCard(
                          date: blogbody[i]["date"],
                          thumbnail: blogbody[i]["image"],
                          title: blogbody[i]["title"],
                          description: blogbody[i]["content"],
                          author: blogbody[i]["author"],
                          comments: blogbody[i]["comments"]?.length,
                        ),
                      )
                  ],
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.all(60.0),
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                )
        ],
      ),
    ));
  }

  //get_posts
  void getBlog() async {
    try {
      var response = await Dio().get('${AdeAPI().baseurl}api/get_posts');
      var data = response.data;
      var firstindex = data[0];
      var body = data.sublist(1);
      setState(() {
        blogheader = firstindex;
        blogbody = body;
      });
    } catch (e) {
      print(e);
    }
  }
}
