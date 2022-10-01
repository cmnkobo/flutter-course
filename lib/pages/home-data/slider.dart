import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdeProductSlider {
  var formatter = NumberFormat("#,###,000");
  Widget getProductSlider({height, products}) {
    return Container(
        child: CarouselSlider(
      items: [
        for (var i = 0; i < products.length; i++)
          InkWell(
            onTap: () {
              //navigate to product details
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5.0),
              //background image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(products[i]["image"]),
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
                              products[i]["category"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            products[i]["title"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                                "₦${formatter.format(int.parse(products[i]["price"]))}",
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
