//cart page
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:ecommerce/pages/cart/cart-function.dart';
import 'package:ecommerce/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdeCartPage extends StatefulWidget {
  AdeCartPage({Key? key}) : super(key: key);

  @override
  State<AdeCartPage> createState() => _AdeCartPageState();
}

class _AdeCartPageState extends State<AdeCartPage> {
  dynamic cart = [];
  AdeCartFunction adeCartFunction = AdeCartFunction();
  var formatter = NumberFormat("#,###,000");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get cart
    getCart();
  }

  //get cart
  getCart() async {
    //get cart from local storage
    var cartRes = await adeCartFunction.getCart();
    //update state
    setState(() {
      cart = cartRes;
    });
  }

  //getTotal
  getTotal() {
    int total = 0;
    for (var i = 0; i < cart.length; i++) {
      int price = int.parse(cart[i]["product"]["price"]);
      int quantity = cart[i]["quantity"];
      total += price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: cart.length > 0
            ? Column(
                children: [
                  for (var i = 0; i < cart.length; i++)
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //product image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            cart[i]["product"]["image"]),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              //product name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    reduceWords(cart[i]["product"]["title"]),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "₦${formatter.format(int.parse(cart[i]["product"]["price"]))}",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              //check if quantity is greater than 1
                                              if (cart[i]["quantity"] > 1) {
                                                //decrease quantity
                                                var newQuantity =
                                                    cart[i]["quantity"] - 1;
                                                //update cart
                                                adeCartFunction.addToCart(
                                                    product: cart[i]["product"],
                                                    quantity: newQuantity);
                                                //update state
                                                getCart();
                                              }
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            cart[i]["quantity"].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              //increase quantity
                                              var newQuantity =
                                                  cart[i]["quantity"] + 1;
                                              //update cart
                                              adeCartFunction.addToCart(
                                                  product: cart[i]["product"],
                                                  quantity: newQuantity);
                                              //update state
                                              getCart();
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //remove cart icon
                                      InkWell(
                                        onTap: () {
                                          //remove cart
                                          adeCartFunction.removeFromCart(
                                              productid: cart[i]["product_id"]);
                                          //snackbar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      "Item removed from cart")));
                                          //update state
                                          getCart();
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "₦${formatter.format((int.parse(cart[i]["product"]["price"]) * cart[i]["quantity"]))}",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  //footer
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₦${formatter.format(getTotal())}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                  //checkout button
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //check if cart is empty
                        if (cart.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Cart is empty")));
                        } else {
                          //navigate to checkout page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdeCheckout(
                                        totalAmount: getTotal(),
                                      )));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Loading Cart...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  //reduce words more than 20
  String reduceWords(String text) {
    if (text.length > 25) {
      return text.substring(0, 25) + "...";
    } else {
      return text;
    }
  }
}
