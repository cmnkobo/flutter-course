// ignore_for_file: prefer_const_constructors

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
      title: "Ade Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  //declare property indexcount
  int indexCount = 0;
  //scaffoldkey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Ade Application"),
        backgroundColor: Colors.black,
        elevation: 10,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg",
                  ),
                  backgroundColor: Colors.white,
                ),
                accountName: Text("Ade"),
                accountEmail: Text("hello@aqskill.com")),
            ListTile(title: Text("Home")),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.contact_phone),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("App Version: 1.0.0"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Am working");
        },
        child: Icon(Icons.share),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Am working",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //image from network
              Image.network(
                "https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg",
                width: 500.0,
                height: 500.0,
              ),
              //input
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  hintText: "Enter your name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This is a sample text This is a sample text This is a sample textThis is a sample text This is a sample text This is a sample text",
                  textAlign: TextAlign.center,
                ),
              ),
              //add elevatedbutton
              ElevatedButton(
                  onPressed: () {
                    //print
                    print("Button Pressed");

                    //show snackbar
                    _scaffoldKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text("Button Pressed"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: Text("Click Me")),
              //table
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print("Home Button Pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Settings Button Pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.contact_phone),
              onPressed: () {
                print("Contact Button Pressed");
              },
            ),
          ],
        )
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexCount,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact",
          ),
        ],
        onTap: (int index) {
          print("Index: $index");
          //update indexCount state
          setState(() {
            indexCount = index;
          });
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  "Welcome to AQskill",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                )),
            ListTile(title: Text("Home")),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.contact_phone),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            Divider(
              color: Colors.black,
              height: 0,
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("App Version: 1.0.0"),
            )
          ],
        ),
      ),
    );
  }
}
