//create blog stateful
import 'package:ecommerce/pages/single-blog.dart';
import 'package:flutter/material.dart';

import 'news-card-list.dart';

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
          //blog header
          InkWell(
            onTap: () {
              //goto blog detail
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdeBlogDetail()));
            },
            child: Container(
              width: double.infinity,
              height: 250,
              //background image
              decoration: const BoxDecoration(
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
                padding: const EdgeInsets.all(15),
                child: const Align(
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
