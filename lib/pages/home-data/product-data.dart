import 'package:ecommerce/pages/shop-single.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdeProductCard {
  var formatter = NumberFormat("#,###,000");
  Widget getCard(context, products) {
    return Wrap(
      children: [
        for (var i = 0; i < products.length; i++)
          InkWell(
            onTap: () {
              //goto product detail
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdeProductDetail(
                            product: products[i],
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 7),
              child: Container(
                //add border color
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                ),
                width: 180,
                height: 220,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(products[i]["image"],
                          width: 180, height: 150, fit: BoxFit.cover),
                      //category
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[i]["category"],
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              Text(
                                products[i]["title"],
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "₦${formatter.format(int.parse(products[i]["price"]))}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Spacer(),
                                  Container(
                                      padding: EdgeInsets.all(3),
                                      //add background color
                                      decoration: BoxDecoration(
                                        color: Colors.orange[200],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        "New Design",
                                        style: TextStyle(fontSize: 9),
                                      ))
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
            ),
          )
      ],
    );
  }
}
