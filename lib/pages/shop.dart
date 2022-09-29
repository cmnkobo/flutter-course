//create ecommerce page
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/pages/home-data/product-data.dart';
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
            AdeProductCard().getCard(context)
          ],
        ),
      ),
    );
  }
}
