import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './cart/cart.dart';
import '../sizeconfig.dart';
import '../constant.dart' as Constants;

class Offers extends StatefulWidget {
  @override
  State createState() => new OffersState();
}

class OffersState extends State<Offers> {
  List data;
  static String apiURL = Constants.API_URL;

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(apiURL + "/posters"),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      if (this.mounted) {
        var converDataToJson = jsonDecode(response.body);
        data = converDataToJson;
        return ("Success");
      }
    }
    return (null);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Offers",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 30,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return posterWidget(index);
                },
              ),
            );
          } else {
            return Center(
              child: Text("Loading images..."),
            );
          }          
        },        
      ),
    );
  }

  Widget posterWidget(index) {
    return Container(
      margin: EdgeInsets.all(12),
      //width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          apiURL + data[index]['poster']['url'].toString(),
          // "https://www.gbusiness.in/includes/templates/lacosteshirtsa.co/images/banner.jpg",
          // "https://i.pinimg.com/236x/9b/0d/b3/9b0db3708b65ff2ab5ee952557b85a25--air-max-one-air-maxes.jpg",          
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text(
                "Unable to load image !",
              ),
            );
          },
        ),
      ),
    );
  }
}
