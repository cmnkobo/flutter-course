import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdeProductSlider {
  Widget getProductSlider({height}) {
    return Container(
        child: CarouselSlider(
      items: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5.0),
          //background image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const NetworkImage(
                  "https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg"),
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
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //add background color
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                          //border radius
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "Men Fashion",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Long Sleeve t shirts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#5,000",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22,
                                fontWeight: FontWeight.w900),
                          ),
                          Container(
                            //add background color
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              //border radius
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Buy Now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
      options: CarouselOptions(
        height: (height / 4.2),
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    ));
  }
}
