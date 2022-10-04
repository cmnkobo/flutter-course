//AdeBlogDetail
// ignore_for_file: prefer_const_constructors, avoid_init_to_null

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/adelogin.dart';
import 'package:ecommerce/pages/comments.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdeBlogDetail extends StatefulWidget {
  final blogdetail;
  const AdeBlogDetail({Key? key, this.blogdetail}) : super(key: key);

  @override
  State<AdeBlogDetail> createState() =>
      // ignore: no_logic_in_create_state
      _AdeBlogDetailState(blogdetail: blogdetail);
}

class _AdeBlogDetailState extends State<AdeBlogDetail> {
  final blogdetail;
  dynamic blogcontent = null;
  dynamic blogcomment = null;
//constructor
  _AdeBlogDetailState({this.blogdetail});

  //oninit
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBlogContent();
    getBlogComment();
  }

  //check if user is logged in
  isUserloggedIn() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    var user_detail = prefs.getString('userdetail');
    if (user_detail == null) {
      return false;
    } else {
      return true;
    }
  }

  //getBlogContent
  getBlogContent() async {
    try {
      var response = await Dio()
          .get('${AdeAPI().baseurl}api/get_post/${blogdetail["post_id"]}');
      var data = response.data;
      setState(() {
        blogcontent = data["content"];
      });
    } catch (e) {
      print(e);
    }
  }

  //getBlogComment
  getBlogComment() async {
    try {
      var response = await Dio()
          .get('${AdeAPI().baseurl}api/get_comments/${blogdetail["post_id"]}');
      var data = response.data;
      // print(data);
      setState(() {
        blogcomment = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogdetail["title"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              //background
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(blogdetail["image"]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(.6),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      blogdetail["title"],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          height: 1.2,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              blogdetail["date"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        //arthor data
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              blogdetail["author"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //share icon and comments
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Share.share(
                          '${blogdetail["title"]} ${blogdetail["link"]}');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.share,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          isUserloggedIn().then((value) {
                            if (value) {
                              //goto comment page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdeBlogComment(
                                            commentArray: blogcomment,
                                            postId: blogdetail["post_id"],
                                          )));
                            } else {
                              //goto login page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdeloginPage()));
                            }
                          });
                        },
                        child: Text(
                          "(${blogcomment != null ? blogcomment.length : '--'}) Comments",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //divider
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            //content
            Container(
                padding: EdgeInsets.all(15),
                child: blogcontent != null
                    ? Text(
                        blogcontent,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.normal),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      )),
            //recent comments
            Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent Comments",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                          //icon to add comment
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              isUserloggedIn().then((value) {
                                if (value) {
                                  //goto comment page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdeBlogComment(
                                                commentArray: blogcomment,
                                                postId: blogdetail["post_id"],
                                              )));
                                } else {
                                  //goto login page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdeloginPage()));
                                }
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add_comment,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Add Comment",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      height: 1.2,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //comment
                      blogcomment != null
                          ? Column(
                              children: [
                                blogcomment.length > 0
                                    ? Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(.2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        blogcomment[0]["user"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            height: 1.2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        blogcomment[0]["date"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            height: 1.2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                blogcomment[0]["comment"],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ]))
                                    : Center(
                                        child: Column(
                                          children: [
                                            Divider(
                                              height: 1,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: const Text(
                                                      "No comments yet",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          height: 1,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    child: const Text(
                                                      "Be the first to comment",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          height: 1,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                      //load more
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              isUserloggedIn().then((value) {
                                if (value) {
                                  //goto comment page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdeBlogComment(
                                                commentArray: blogcomment,
                                                postId: blogdetail["post_id"],
                                              )));
                                } else {
                                  //goto login page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdeloginPage()));
                                }
                              });
                            },
                            child: Text(
                              "Load More",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
