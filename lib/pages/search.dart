// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/home-data/news-card-list.dart';
import 'package:ecommerce/pages/service/api.dart';
import 'package:ecommerce/pages/single-blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdeSearchPage extends StatefulWidget {
  const AdeSearchPage({Key? key}) : super(key: key);

  @override
  State<AdeSearchPage> createState() => _AdeSearchPageState();
}

class _AdeSearchPageState extends State<AdeSearchPage> {
  //search controller
  final TextEditingController _searchController = TextEditingController();

  dynamic searchResult = [];

  //oninit
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchPost("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                //focusBorder
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusColor: Colors.black,
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          //button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                //search
                var searchText = _searchController.text;
                //check if empty
                if (searchText.isEmpty) {
                  //show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a search term"),
                    ),
                  );
                } else {
                  //show snackbar for 1 minute
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a search term"),
                      duration: Duration(minutes: 1),
                    ),
                  );
                  //search
                  await searchPost(searchText);
                }
              },
              child: const Text("Search Post", style: TextStyle(fontSize: 15)),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          searchResult.length > 0
              ? Column(
                  children: [
                    for (var i = 0; i < searchResult.length; i++)
                      InkWell(
                        onTap: () {
                          //goto blog detail
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdeBlogDetail(
                                      blogdetail: searchResult[i])));
                        },
                        child: AdeBlogList().getCard(
                          date: searchResult[i]["date"],
                          thumbnail: searchResult[i]["image"],
                          title: searchResult[i]["title"],
                          description: searchResult[i]["content"],
                          author: searchResult[i]["author"],
                          comments: searchResult[i]["comments"]?.length,
                        ),
                      )
                  ],
                )
              : Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    CircularProgressIndicator(
                      color: Colors.black,
                    )
                  ],
                ),
        ]),
      ),
    );
  }

  //make dio request
  searchPost(searchtext) async {
    var dio = Dio();
    var data = {"type": "post", "search_text": searchtext};
    //convert to form
    var formData = FormData.fromMap(data);
    //make request
    var response =
        await dio.post("${AdeAPI().baseurl}api/search", data: formData);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //check if the response is true
    if (response.data["code"] == 200) {
      //hide keyboard
      FocusScope.of(context).unfocus();
      //set the state
      setState(() {
        searchResult = response.data["posts"];
      });
    } else {
      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.data["message"]),
        ),
      );
    }
  }
}
