//create ecommerce page
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/pages/home-data/product-data.dart';
import 'package:ecommerce/pages/home-data/slider.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';

class AdeEcommerce extends StatefulWidget {
  const AdeEcommerce({Key? key}) : super(key: key);

  @override
  State<AdeEcommerce> createState() => _AdeEcommerceState();
}

class _AdeEcommerceState extends State<AdeEcommerce> {
  dynamic products = [];
  dynamic productsHeader = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  //get products
  getProducts() async {
    var dio = Dio();
    var response = await dio.get("${AdeAPI().baseurl}api/get_products");
    //pick two products productsHeader
    var productsHeader1 = response.data.sublist(0, 2);
    //pick the rest of the products and take out first two
    var products1 = response.data.sublist(2);
    setState(() {
      products = products1;
      productsHeader = productsHeader1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: products.length > 0
            ? Column(
                children: [
                  AdeProductSlider().getProductSlider(
                      height: height,
                      products: productsHeader,
                      context: context),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  //product list
                  AdeProductCard().getCard(context, products)
                ],
              )
            : Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
      ),
    );
  }
}
