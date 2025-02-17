import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart' as Constants;


class CardObject extends StatefulWidget {
  final int orderId;
  final String useremail;
  CardObject({Key key, this.orderId, this.useremail}) : super(key: key);
  @override
  _CardObjectState createState() => _CardObjectState();
}

class _CardObjectState extends State<CardObject> {
  List data;
  static String apiURL = Constants.API_URL;

  Future<String> getJsonData(orderId) async {
    var response = await http.get(
        Uri.encodeFull(apiURL + "/products?id=$orderId"),
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
  void initState() {
    super.initState();
    getJsonData(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: FutureBuilder(
        future: getJsonData(widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildCard();
          } else {
            return Center(
              child: Column(
                children: <Widget>[
                  Divider(
                    thickness: 2,
                    height: 32,
                  ),
                  Text("Loading Ordered Items"),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0.5,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Image.network(
          apiURL + data[0]['image']['formats']['thumbnail']['url'].toString(),
          fit: BoxFit.cover,
        ),
        title: Row(
          children: <Widget>[
            Flexible(
              child: Text(
                data[0]['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        subtitle: Text("Rs. " + data[0]['price'].toString()),
        trailing: IconButton(
          icon: Icon(Icons.cancel, size: 28, color: Colors.red),
          onPressed: () {
            alertBox();
          },
        ),
      ),
    );
  }

  void alertBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cancel Order"),
          content: Text(
              "Your refund will be issued automatically within 2-3 days. Are you sure you want to cancel your order ?"),
          actions: [
            FlatButton(
              child: Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                Firestore.instance
                    .collection('users')
                    .document(widget.useremail)
                    .updateData({
                  'myOrders': FieldValue.arrayRemove([widget.orderId])
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
