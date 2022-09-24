//create ecommerce page
import 'package:flutter/material.dart';

class AdeEcommerce extends StatefulWidget {
  const AdeEcommerce({Key? key}) : super(key: key);

  @override
  State<AdeEcommerce> createState() => _AdeEcommerceState();
}

class _AdeEcommerceState extends State<AdeEcommerce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Ecommerce"),
    );
  }
}
