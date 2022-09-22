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
      //white background
      theme: ThemeData(
        colorScheme:
            ColorScheme.light(primary: Colors.white, onPrimary: Colors.black),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("News App", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            //share
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                //share
                print("Share");
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search");
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Container(
                width: double.infinity,
                //background with image opacity
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.lindaikejisblog.com/photos/shares/thumbs/632a1c4d0947f.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(.0),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Queen's funeral was watched by average audience of 26.2million on British TV stations",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            height: 1.2,
                            fontWeight: FontWeight.w900),
                      ),
                    )),
              ),

              //body
              for (var i = 0; i < 10; i++)
                AdeNewsCard().getCard(
                    title:
                        "Nigerian couple who met on Twitter celebrate 8th wedding anniversary",
                    description:
                        "A Nigerian couple, Tunde and Foluso Leye, who met on Twitter, celebrated their 8th wedding anniversary on Tuesday, September 20.   Tunde had tweeted about bad network on April 2013",
                    imageUrl:
                        "https://www.lindaikejisblog.com/photos/shares/thumbs/632a11d666321.jpg",
                    author: "Linda Ikeji",
                    date: "20/09/22",
                    comments: "2"),
            ],
          ),
        ));
  }
}

class AdeNewsCard {
  //return card
  Widget getCard({title, description, imageUrl, author, date, comments}) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          //title
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [
                //image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //date
                      Text.rich(
                        TextSpan(
                          text: "by ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text: author,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  height: 1.2,
                                  fontWeight: FontWeight.w900),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Linda Ikeji");
                                },
                            ),
                            TextSpan(
                              text: " at $date",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Comment");
                                },
                            ),
                            TextSpan(
                                text: " ($comments comments)",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    height: 1.2,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            height: 1.2,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
