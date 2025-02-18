import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';

import '../../sizeconfig.dart';
import 'cartData.dart';
import 'cartModel.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double subtotal;
  CartDb cartDb = CartDb();
  List<CartObj> cartobjs;
  int count;
  String useremailid, username, address;
  int phone;

  final FirebaseAuth auth = FirebaseAuth.instance;
  Razorpay razorpay;

  getCurrentUser() async {
    final FirebaseUser user = await auth.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.email)
        .get()
        .then((value) {
      setState(() {
        username = value.data['name'];
        useremailid = value.data['email'];
        phone = value.data['phone'];
        address = value.data['addressLine1'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, success);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, error);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, wallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void onCheckout() {
    var option = {
      'key': 'rzp_test_upPK53iLb5xy08',
      'amount': subtotal * 100,
      'name': 'Shopmate',
      'prefill.name': username,
      'prefill.email': useremailid,
      'prefill.contact': phone,
    };
    try {
      razorpay.open(option);
    } catch (e) {
      debugPrint(e);
    }
  }

  void success(PaymentSuccessResponse response) {
    alertBox('SUCCESS : ' + response.paymentId);
    for (int i = 0; i < cartobjs.length; i++) {
      Firestore.instance.collection('users').document(useremailid).updateData({
        "myOrders": FieldValue.arrayUnion([cartobjs[i].id])
      });    
      _deleteitem(context, cartobjs[i]);
    }
  }

  void error(PaymentFailureResponse response) {
    alertBox('ERROR : ' + response.code.toString() + " :- " + response.message);
  }

  void wallet(ExternalWalletResponse response) {
    alertBox('WALLET : ' + response.walletName);
  }

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

    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/bgblack.png"),
            //   fit: BoxFit.cover,
            // ),
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          ),

          //color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "My Cart",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 30,
                          color: Colors.white),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                SizedBox(height: 10),
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
      
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(right: 12),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  "Subtotal: Rs." + subtotal.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  if(address == null){
                    alertBox("Enter address details in profile section");
                  }
                  else{
                    onCheckout();
                  }
                },
                child: new Text(
                  "Check Out",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.black,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
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
                  width: 100,
                ),
                title: Text(cartobjs[index].name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("₹ " + cartobjs[index].price.toString(),
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700)),
                    Text("Size: " + cartobjs[index].quantity.toString()),
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