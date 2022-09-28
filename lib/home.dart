// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/home-data/news-card.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:ecommerce/pages/shop.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';

//Entry Widget
class AdeEntryWidget extends StatelessWidget {
  const AdeEntryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return materialApp
    return MaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
      ),
      home: AdeHomePage(),
    );
  }
}

//AdeHomePage
class AdeHomePage extends StatefulWidget {
  const AdeHomePage({Key? key}) : super(key: key);

  @override
  State<AdeHomePage> createState() => _AdeHomePageState();
}

class _AdeHomePageState extends State<AdeHomePage> {
  //scaffoldkey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//add pageIndex
  int pageIndex = 0;
  String apptitle = "News App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          apptitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              //share app
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.ade.newsapp",
                  subject: "News App");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //navigate to search 'AdeSearchPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdeSearchPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: pageIndex == 0 ? Colors.white : Colors.red,
        foregroundColor: pageIndex == 0 ? Colors.black : Colors.white,
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: pageIndex,
        children: [AdeBlogPage(), AdeEcommerce()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            //if index is 2 goto page
            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdeCartPage()));
            } else {
              //rebuild ui
              setState(() {
                pageIndex = index;
                //update title
                if (index == 0) {
                  apptitle = "News App";
                } else {
                  apptitle = "Ecommerce";
                }
              });
            }
          },
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Ecommerce",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
          ]),
    );
  }
}
