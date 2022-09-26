//AdeBlogDetail
import 'package:flutter/material.dart';

class AdeBlogDetail extends StatefulWidget {
  const AdeBlogDetail({Key? key}) : super(key: key);

  @override
  State<AdeBlogDetail> createState() => _AdeBlogDetailState();
}

class _AdeBlogDetailState extends State<AdeBlogDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atiku Abubakar's secretary, Abdullah Nyako is dead"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              //background
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.lindaikejisblog.com/photos/shares/thumbs/632cb2cdbdaa4.PNG"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(.6),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Atiku Abubakar's secretary, Abdullah Nyako is dead",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          height: 1.2,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "2021-09-10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        //arthor data
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Linda Ikeji",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //share icon and comments
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.2,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.comment,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(2) Comments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.2,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //divider
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            //content
            Container(
                padding: EdgeInsets.all(15),
                child: const Text(
                  "Atiku Abubakar's secretary, Abdullah Nyako is dead. He died on Sunday, September 12, 2021, at the age of 60. He was the secretary to the former vice president of Nigeria, Atiku Abubakar. He was also the former governor of Adamawa state. He died in a hospital in Abuja after a brief illness. May his soul rest in peace, Amen.\n\nAtiku Abubakar's secretary, Abdullah Nyako is dead. He died on Sunday, September 12, 2021, at the age of 60. He was the secretary to the former vice president of Nigeria, Atiku Abubakar. He was also the former governor of Adamawa state. He died in a hospital in Abuja after a brief illness. May his soul rest in peace, Amen.\n\nAtiku Abubakar's secretary, Abdullah Nyako is dead. He died on Sunday, September 12, 2021, at the age of 60. He was the secretary to the former vice president of Nigeria, Atiku Abubakar. He was also the former governor of Adamawa state. He died in a hospital in Abuja after a brief illness. May his soul rest in peace, Amen.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.2,
                      fontWeight: FontWeight.normal),
                )),
            //recent comments
            Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent Comments",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                          //icon to add comment
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(
                                Icons.add_comment,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add Comment",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    height: 1.2,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //comment
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.lindaikejisblog.com/photos/shares/thumbs/632cb2cdbdaa4.PNG"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Linda Ikeji",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              height: 1.2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "2021-09-10",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              height: 1.2,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Atiku Abubakar's secretary, Abdullah Nyako is dead. He died on Sunday, September 12, 2021, at the age of 60. He was the secretary to the former vice president of Nigeria.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 1,
                                      fontWeight: FontWeight.normal),
                                ),
                              ])),
                    ]))
          ],
        ),
      ),
    );
  }
}
