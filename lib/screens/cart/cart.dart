import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../productpage.dart';
import 'cartData.dart';
import 'cartModel.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double subtotal;

  CartDb cartDb = CartDb();
  List<CartObj> cartobjs;
  int count;
  // List data;


  @override
  Widget build(BuildContext context) {
    if (cartobjs == null) {
      cartobjs = List<CartObj>();
      updateListview();
    }

    subtotal = 0;
    for (int i = 0; i < cartobjs.length; i++) {
      subtotal += cartobjs[i].price;
    }

    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: (){}),
        backgroundColor: Color(0xFF343239),
        elevation: 0,
        title: new Text("Cart",style:  TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300, color: Colors.white)),
      ),
      body: Hero(
        tag: 'category',
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: cartobjs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[listview(context, index)],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF343239),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  "Subtotal: " + subtotal.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  //fetch();
                },
                child: new Text(
                  "Check Out",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listview(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        height: 130,
        child: Card(
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              ListTile(
                leading: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/imgloading.gif',
                  image: cartobjs[index].image.toString(),
                  fit: BoxFit.cover,
                  height: 100,
                  //width: 100,
                ),
                title: Text(cartobjs[index].name, style:  TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700)),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("₹ " + cartobjs[index].price.toString(),style:  TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700)),
                    Text("Size: "+cartobjs[index].quantity.toString()),
                    ],
                ),
                
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteitem(context, cartobjs[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteitem(BuildContext context, CartObj cartObj) async {
    int result = await cartDb.deleteCartItem(cartObj.id);
    if (result != 0) {
      Fluttertoast.showToast(msg: 'Item Removed from cart');
      updateListview();
    }
  }

  void updateListview() {
    final Future<Database> dbFuture = cartDb.initialseDb();
    dbFuture.then((databse) {
      Future<List<CartObj>> cartListFuture = cartDb.getCartItems();
      cartListFuture.then((onValue) {
        setState(() {
          this.cartobjs = onValue;
          this.count = cartobjs.length;
        });
      });
    });
  }

  // Future fetch() async {
  //   var status;
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'Authorization';
  //   final value = prefs.getString(key) ?? 0;
  //   print(value);
  //   String jsonUser = jsonEncode(cartobjs);
  //   //print(cartobjs);

  //   final response = await http.post('https://kartmate.herokuapp.com/api/v1/order/', headers: {
  //     "Authorization": '$value',
  //     "Content-Type": "application/json"

  //   },
  //   body: jsonEncode({"items": cartobjs,"price": 4})
  //   );
  //   status = response.body.contains('error');
  //   print(jsonEncode({"items": cartobjs,"price": 4}));
  //   var data = jsonDecode(response.body);
  //   // var data = json.decode(response.body);
  //   // print(data['key']);
  //   print(response.statusCode);
  //   if (status) {
  //     print('data : ${data["error"]}');
  //     return null;
  //   } else {
  //     //print('data : ${data["key"]}');

  //     return data["key"];
  //   }
  // }
}
