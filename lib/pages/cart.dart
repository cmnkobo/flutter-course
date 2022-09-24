//cart page
import 'package:flutter/material.dart';

class AdeCartPage extends StatefulWidget {
  AdeCartPage({Key? key}) : super(key: key);

  @override
  State<AdeCartPage> createState() => _AdeCartPageState();
}

class _AdeCartPageState extends State<AdeCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Text("I am cart Page"),
      ),
    );
  }
}
