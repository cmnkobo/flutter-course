//new class for blog list template
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                  style: const TextStyle(
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
              const SizedBox(
                height: 5,
              ),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
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
