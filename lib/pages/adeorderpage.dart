// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/adeorderdetail.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class AdeOrderPage extends StatefulWidget {
  const AdeOrderPage({Key? key}) : super(key: key);

  @override
  State<AdeOrderPage> createState() => _AdeOrderPageState();
}

class _AdeOrderPageState extends State<AdeOrderPage> {
  dynamic orders = [];

  //get orders
  getOrder() async {
    var dio = Dio();
    var user = await userData();
    if (user != null) {
      //send data to server
      var response = await dio.get(
        "${AdeAPI().baseurl}order-api/get_order/${user["id"]}",
      );
      //set
      setState(() {
        orders = response.data;
      });
    }
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Page"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return AdeHomePage();
            }));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: orders.length > 0
            ? Column(
                children: [
                  for (var order in orders)
                    InkWell(
                      onTap: () {
                        //go to order detail page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AdeOrderDetail(
                            order: order,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3.0, 5, 3, 5),
                            child: ListTile(
                              title: Text(
                                "#${order["order_id"]}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Order Date: ${order["date"]}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("Order Status: ${order["status"]}",
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                              trailing: Text("₦${order["amount"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Order Yet"),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        getOrder();
                      },
                      child: Text(
                        "Refresh",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
