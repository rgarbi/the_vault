import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_vault/screens/whisky_detail_page.dart';
import 'package:the_vault/models/whiskey_review.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {

  Future<List<WhiskeyReview>> _getReviews() async {
    var data = await http.get("http://localhost:50346/assets/data.json");
    var jsonData = json.decode(data.body);

    List<WhiskeyReview> reviews = [];

    for(var review in jsonData) {
      WhiskeyReview whiskeyReview = WhiskeyReview(review["name"],review["distillery"],review["review_url"],review["type"], review["review_image"]);
      reviews.add(whiskeyReview);
    }

    print(reviews.length);

    return reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Whisk(e)y Vault"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getReviews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),),
                );
            } else {
              return Container(
                child: Row (
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('American Whiskey', style: TextStyle(fontSize: 20)),
                        ),),
                        const SizedBox(height: 30),
                      ],
                    ),
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data[index].reviewImage
                              ),
                            ),
                            title: Text(snapshot.data[index].name),
                            subtitle: Text("Distillery: " + snapshot.data[index].distillery),
                            onTap: () {
                              Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => ReviewDetailPage(snapshot.data[index]))
                              );
                            },
                          )
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
