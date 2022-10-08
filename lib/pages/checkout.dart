// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:ade_flutterwave_working_version/core/ade_flutterwave.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/pages/adeorderpage.dart';
import 'package:ecommerce/pages/cart/cart-function.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_theoaks_paystack/flutter_theoaks_paystack.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce/pages/adelogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(
        publicKey: "pk_test_6f4b359d153b9ff2e31970e93cf5dd9054693d4e");
  }

  //check if user is logged in
  isUserloggedIn() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    var user_detail = prefs.getString('userdetail');
    if (user_detail == null) {
      return false;
    } else {
      return true;
    }
  }

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
          onTap: () async {
            isUserloggedIn().then((value) {
              if (value) {
                //process flutterpayment
                processFlutterwave();
              } else {
                //goto login page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdeloginPage()));
              }
            });
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
                  image: AssetImage(
                    "assets/img/61e9e9f6e231ba78035e36d2_Flutterwave.png",
                  ),
                  height: 60,
                  width: double.infinity),
            ),
          ),
        ),
        //paystack
        InkWell(
          onTap: () async {
            isUserloggedIn().then((value) {
              if (value) {
                //process paystack
                processPaystack(context);
              } else {
                //goto login page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdeloginPage()));
              }
            });
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
                  image: AssetImage(
                    "assets/img/Paystack_Logo.png",
                  ),
                  height: 60,
                  width: double.infinity),
            ),
          ),
        ),
      ]),
    );
  }

  //processflutterwave
  processFlutterwave() async {
    //get data from shared preferences
    final prefs = await SharedPreferences.getInstance();
    //get string
    var userdetail = prefs.getString('userdetail');
    //decode userdetail
    var userdetaildecoded = jsonDecode(userdetail!);
    var user_id = userdetaildecoded["user_details"]["id"];
    var data = {
      'amount': totalAmount,
      'email': "${userdetaildecoded["user_details"]["email"]}",
      'phone': "",
      'name': "${userdetaildecoded["user_details"]["name"]}",
      'title': 'Products Payment',
      'currency': "NGN",
      'tx_ref': "ecommerceapp-${DateTime.now().millisecondsSinceEpoch}",
      'icon': "https://www.aqskill.com/wp-content/uploads/2020/05/logo-pde.png",
      'public_key': "FLWPUBK_TEST-e0787ab2e5b0b6fcb3d32ce465ad44d0-X",
      'sk_key': 'FLWSECK_TEST-af1af523da3f141f894a26be4b071230-X'
    };

    //get only product id and quantity
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdeFlutterWavePay(data),
      ),
    ).then((payresponse) async {
      //payresponse is the payresponse from the payment
      if (payresponse["status"] != "success") {
        //show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Payment Failed"),
          backgroundColor: Colors.red,
        ));
        return false;
      }
      var tx_id = payresponse["data"]["id"];
      processServerData(tx_id, "flutterwave", user_id);
    });
  }

  //processServerData
  processServerData(tx_id, gateway, user_id) async {
    //get cart
    var allcart = await AdeCartFunction().getCart();
    var products = [];
    for (var cartdata in allcart) {
      products.add({
        "product_id": cartdata["product_id"],
        "quantity": cartdata["quantity"],
        "product_price": cartdata["product"]["price"]
      });
    }

    var dio = Dio();
    var total = await getTotal();
    //send data to server
    var serverData = {
      "user_id": user_id,
      "products": products,
      "total": total,
      "payment_gateway": gateway,
      "tx_id": "$tx_id"
    };

    //convert to formdata
    var formData = FormData.fromMap(serverData);

    //send data to server
    var response =
        await dio.post("${AdeAPI().baseurl}api/create_order", data: formData);
    //check if the response is 200
    if (response.data["code"] == 200) {
      //clear the cart
      await AdeCartFunction().clearCart();
      //go to order page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdeOrderPage()));
    } else {
      //show info
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.data["message"])));
    }
  }

  //getTotal
  getTotal() async {
    int total = 0;
    var cart = await AdeCartFunction().getCart();
    for (var i = 0; i < cart.length; i++) {
      int price = int.parse(cart[i]["product"]["price"]);
      int quantity = cart[i]["quantity"];
      total += price * quantity;
    }
    return total;
  }

  //paystack
  processPaystack(context) async {
    //get data from shared preferences
    final prefs = await SharedPreferences.getInstance();
    //get string
    var userdetail = prefs.getString('userdetail');
    //decode userdetail
    var userdetaildecoded = jsonDecode(userdetail!);
    var total = await getTotal();
    Charge charge = Charge()
      ..amount = total * 100
      ..reference = "${DateTime.now().millisecondsSinceEpoch}"
      // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = "${userdetaildecoded["user_details"]["email"]}";
    CheckoutResponse response = await plugin.checkout(
      context = context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
    if (response.status) {
      processServerData(response.reference, "paystack",
          userdetaildecoded["user_details"]["id"]);
    } else {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Payment Failed"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
