import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../sizeconfig.dart';


import 'myOrdersCard.dart';

class Order extends StatefulWidget {
  final String useremail;
  Order({Key key, this.useremail}) : super(key: key);
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List data;

  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> orderSnapshot = Firestore.instance
        .collection('users')
        .document(widget.useremail)
        .snapshots();

    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          ),

          //color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "My Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: height / 25,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: orderSnapshot,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: Text("Loading..."));
          else {
            var orderIdList = snapshot.data.data['myOrders'];
            return Container(
              child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: orderIdList == null ? 0 : orderIdList.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(index);
                  // getJsonData(orderIdList[index]);
                  return CardObject(orderId :orderIdList[index], useremail: widget.useremail);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget orderWidget(orderId) {
    print(orderId);
    print(data);

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 6,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Row(
          children: <Widget>[
            Icon(Icons.play_arrow, color: Colors.yellowAccent),
            Text(
              "asd",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
