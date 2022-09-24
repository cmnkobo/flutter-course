// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  //runapp
  runApp(const AdeEntryWidget());
}

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
              print("Share");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search");
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

//new class for blog list template
class AdeBlogList {
  //method
  Widget getCard({thumbnail, title, description, author, date}) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Row(children: [
          //image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w900, height: 1.2),
              ),
              SizedBox(height: 5),
              //date and author
              Text.rich(TextSpan(
                  text: "by ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1.2,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                        text: author,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          height: 1.2,
                          fontWeight: FontWeight.w900,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Linda Ikeji");
                          }),
                    TextSpan(
                        text: " at $date",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          height: 1.2,
                          fontWeight: FontWeight.normal,
                        )),
                    //comment
                    TextSpan(
                        text: " (2 Comments)",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          height: 1.2,
                          fontWeight: FontWeight.normal,
                        )),
                  ])),
              SizedBox(
                height: 5,
              ),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.2,
                    fontWeight: FontWeight.normal),
              )
            ],
          ))
        ]),
      ),
    );
  }
}

//create blog stateful

class AdeBlogPage extends StatefulWidget {
  AdeBlogPage({Key? key}) : super(key: key);

  @override
  State<AdeBlogPage> createState() => _AdeBlogPageState();
}

class _AdeBlogPageState extends State<AdeBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //header
          Container(
            width: double.infinity,
            height: 250,
            //background image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.lindaikejisblog.com/photos/shares/thumbs/632cb2cdbdaa4.PNG"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(.0),
                ],
              )),
              padding: EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Atiku Abubakar's secretary, Abdullah Nyako is dead",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w900),
                  )),
            ),
          ),

          //body
          for (var i = 0; i < 3; i++)
            AdeBlogList().getCard(
                date: "2021-09-10",
                thumbnail:
                    "https://www.lindaikejisblog.com/photos/shares/thumbs/632ca30dd14bc.PNG",
                title:
                    "Nigerian prophet sentenced to 7 years in jail for defrauding church member of N59.7 million",
                description:
                    "An Ikeja Special Offences Court in Lagos has sentenced a Lagos-based prophet, Cletus Ilongwo, to seven years imprisonment for defrauding his church member of N59.7 million.   Recall tha",
                author: "Linda Ikeji"),
        ],
      ),
    ));
  }
}

//create ecommerce page
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

//cart page
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
