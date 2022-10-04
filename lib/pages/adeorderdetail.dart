// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdeOrderDetail extends StatefulWidget {
  final order;
  const AdeOrderDetail({Key? key, this.order}) : super(key: key);

  @override
  State<AdeOrderDetail> createState() => _AdeOrderDetailState(this.order);
}

class _AdeOrderDetailState extends State<AdeOrderDetail> {
  final order;
  dynamic products = [];
  _AdeOrderDetailState(this.order);
  var formatter = NumberFormat("#,###,000");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderDetail();
  }

  //get order detail
  getOrderDetail() async {
    //get order detail
    var dio = Dio();
    var user = await userData();
    //send data to server
    var response = await dio.get(
      "${AdeAPI().baseurl}order-api-single/get_order_by_id/${user["id"]}/${order["order_id"]}",
    );
    //set
    setState(() {
      products = response.data["products"];
    });
  }

  //userdata
  userData() async {
    //get data from shared preferences
    final prefs = await SharedPreferences.getInstance();
    try {
      //get string
      var userdetail = prefs.getString('userdetail');
      //decode userdetail
      var userdetaildecoded = jsonDecode(userdetail!);
      return userdetaildecoded["user_details"];
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order Detail"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10),
              child: Text("Ordered Products:",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            products.length > 0
                ? Column(
                    children: [
                      for (var product in products)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 8),
                          child: Card(
                            child: ListTile(
                              leading: Image(
                                image:
                                    NetworkImage(product["product"]["image"]),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(product["product"]["title"]),
                              subtitle: Text(
                                  "Qty: ${product["quantity"]} * ${product["product"]["price"]}"),
                              trailing: Text(
                                  "₦${formatter.format(int.parse(product["product"]["price"]) * int.parse(product["quantity"]))}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Order Status: ${order["status"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Order Date: ${order["date"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("No Product Ordered"),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Go Back"))
                        ],
                      ),
                    ),
                  )
          ],
        ));
  }
}
