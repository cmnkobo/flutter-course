//create ecommerce page
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/pages/home-data/slider.dart';
import 'package:flutter/material.dart';

class AdeEcommerce extends StatefulWidget {
  const AdeEcommerce({Key? key}) : super(key: key);

  @override
  State<AdeEcommerce> createState() => _AdeEcommerceState();
}

class _AdeEcommerceState extends State<AdeEcommerce> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdeProductSlider().getProductSlider(height: height),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            //product list
            Wrap(
              children: [
                for (var i = 0; i < 10; i++)
                  Card(
                    child: Container(
                      //add border color
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      width: 180,
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg",
                            width: 180,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          //category
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Men Fashion",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                                //title
                                Text(
                                  "Long Sleeve t shirts",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                //price
                                Row(
                                  children: [
                                    Text(
                                      "#5,000",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Spacer(),
                                    Container(
                                        //add background color
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "New Design",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
