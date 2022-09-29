// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdeShopSingle extends StatefulWidget {
  const AdeShopSingle({Key? key}) : super(key: key);

  @override
  State<AdeShopSingle> createState() => _AdeShopSingleState();
}

class _AdeShopSingleState extends State<AdeShopSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/12/7027f088-902d-404b-a442-15d55cb36f17-e1513640648577.jpg?auto=format&q=60&fit=max&w=930",
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            //status bar color
            backgroundColor: Colors.black,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "#5,000",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //share icon
                        Spacer(),
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Smart Polo Shirt - Black",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        //add background color
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Men Fashion",
                          style: TextStyle(fontSize: 10),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Abidemi Rufai, the suspended aide of Governor Dapo Abiodun of Ogun State has been sentenced to five years' imprisonment for fraud by a US court. \n\nRufai had attempted to use stolen identities to steal nearly \$2.4 million from the United States government, including approximately \$500,000 in pandemic-related unemployment benefits. \n\nAccording to the statement, Rufai admitted a long history of using stolen identities to defraud U.S. disaster programs Abidemi Rufai, the suspended aide of Governor Dapo Abiodun of Ogun State has been sentenced to five years' imprisonment for fraud by a US court. \n\nRufai had attempted to use stolen identities to steal nearly \$2.4 million from the United States government, including approximately \$500,000 in pandemic-related unemployment benefits.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
