// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AdeCheckout extends StatefulWidget {
  final totalAmount;
  const AdeCheckout({Key? key, this.totalAmount}) : super(key: key);

  @override
  State<AdeCheckout> createState() =>
      _AdeCheckoutState(totalAmount: totalAmount);
}

class _AdeCheckoutState extends State<AdeCheckout> {
  dynamic totalAmount;
  var formatter = NumberFormat("#,###,000");

  _AdeCheckoutState({this.totalAmount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Column(children: [
        //total amount
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "₦${formatter.format(totalAmount)}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        //Divider
        Divider(
          thickness: 2,
        ),
        //payment method title
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              //icon
              Icon(Icons.credit_card)
            ],
          ),
        ),
        //flutterwave
        InkWell(
          onTap: () {
            print("Flutterwave");
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              //add background color
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: double.infinity,
              child: Image(
                  image: NetworkImage(
                    "https://uploads-ssl.webflow.com/605b36f6f1e296440dc6f503/61e9e9f6e231ba78035e36d2_Flutterwave.png",
                  ),
                  height: 60,
                  width: double.infinity),
            ),
          ),
        ),
        //paystack
        InkWell(
          onTap: () {
            print("Paystack");
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              //add background color
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: double.infinity,
              child: Image(
                  image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/0/0b/Paystack_Logo.png",
                  ),
                  height: 60,
                  width: double.infinity),
            ),
          ),
        ),
      ]),
    );
  }
}
