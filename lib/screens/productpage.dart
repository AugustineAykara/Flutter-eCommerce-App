import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart/cartData.dart';
import 'cart/cartModel.dart';

import '../sizeconfig.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final List data;
  final String userDoc;
  ProductPage({Key key, this.id, this.data, this.userDoc}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int id;
  List data;
  String userDoc;
  int active =0;
  int idsss = 1;
  
  
  CartDb cartDb = CartDb();

  @override
  Widget build(BuildContext context) {
    id = widget.id;
    data = widget.data;
    userDoc = widget.userDoc;
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 4,
                    ),
                    Center(
                      child: new SizedBox(
                        height: SizeConfig.blockSizeVertical * 40,
                        //width: width,
                        child: new SizedBox(
                          child: Image.network(
                            "13.126.219.172:1337" +
                                data[id]['image']['url'].toString(),
                            //Image.network(data[index]['event_poster'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // new Container(
            //         height: .5,
            //         color: Colors.grey,
            //         width: width / 1,
            //       ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  new Text(data[id]['name'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.blockSizeVertical * 4)),
                  new Text("Sports Shoe",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeVertical * 2)),
                  SizedBox(
                    height: 10,
                  ),
                  new Text("Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.blockSizeVertical * 2)),
                  new Text(data[id]['description'].toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 2)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Text(
                        "Total Amount",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                    Text(data[id]['price'].toString(),
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              RaisedButton(
                elevation: 1,
                color: Colors.deepOrange,
                onPressed: () {
                  // Firestore.instance
                  //     .collection('users')
                  //     .document(userDoc)
                  //     .updateData({
                  //   "cartItems": FieldValue.arrayUnion([data[id]['id']])
                  // });
                  // alertBox(data[id]['name'] + " added to cart");
                  // var price = double.parse(data[id]['price'].toString());
                  // print(price);
                  CartObj cart = CartObj(data[id]['id'], "http://13.126.219.172:1337" +data[id]['image']['formats']['thumbnail']['url'].toString(), data[id]['name'].toString(), double.parse(data[id]['price'].toString()), 1, 'kg');
                  cartDb.insertCartItem(cart);
                  idsss++;
                },
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.white),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              )
            ],
          )),
    );
  }

  void alertBox(message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
