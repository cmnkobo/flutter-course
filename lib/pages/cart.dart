//cart page
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AdeCartPage extends StatefulWidget {
  AdeCartPage({Key? key}) : super(key: key);

  @override
  State<AdeCartPage> createState() => _AdeCartPageState();
}

class _AdeCartPageState extends State<AdeCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              for (var i = 0; i < 10; i++)
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //rounded image
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //product name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              reduceWords(
                                "Ladies Quality Round Neck Polo Printed T Shirt",
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "₦1,000",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    //minus icon
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.withOpacity(0.3)),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    //quantity
                                    Text("1"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    //plus icon
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.withOpacity(0.3)),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "= ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900)),
                                      TextSpan(
                                          text: " ₦1000",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900)),
                                    ])),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  //reduce words more than 20
  String reduceWords(String text) {
    if (text.length > 27) {
      return text.substring(0, 27) + "...";
    } else {
      return text;
    }
  }
}
