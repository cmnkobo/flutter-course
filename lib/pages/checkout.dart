// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdeCheckoutPage extends StatefulWidget {
  const AdeCheckoutPage({Key? key}) : super(key: key);

  @override
  State<AdeCheckoutPage> createState() => _AdeCheckoutPageState();
}

class _AdeCheckoutPageState extends State<AdeCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          //total amount
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Text("Total Amount",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.w900)),
                const Spacer(),
                const Text("#100,000",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          //pay with card
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Pay with Card",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w900)),
                const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
          //flutterwave
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 10),
            child: Container(
              //border radius
              decoration: const BoxDecoration(
                //color with opacity
                color: Color.fromARGB(22, 111, 110, 110),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              child: const Image(
                image: NetworkImage(
                    "https://miro.medium.com/max/1400/1*ozf8hvC5y6BJhZAMp5FFMA.png"),
                height: 60,
                width: double.infinity,
              ),
            ),
          ),
          //paystack
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
            child: Container(
              //border radius
              decoration: const BoxDecoration(
                //color with opacity
                color: Color.fromARGB(22, 111, 110, 110),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/0/0b/Paystack_Logo.png"),
                  height: 60,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
