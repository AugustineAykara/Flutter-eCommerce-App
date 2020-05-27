import 'package:flutter/material.dart';
import 'cart/cartData.dart';
import 'cart/cartModel.dart';
import '../sizeconfig.dart';
import 'cart/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final List data;
  ProductPage({Key key, this.id, this.data}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int id;
  List data;
  String userDoc;
  String _selectedValue = '6';
  List<CartObj> cartobjs;
   int count;
  List<RadioModel> sampleData = new List<RadioModel>();

  static String apiURL = "http://13.126.207.59:1337";
  CartDb cartDb = CartDb();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(true, '6'));
    sampleData.add(new RadioModel(false, '7'));
    sampleData.add(new RadioModel(false, '8'));
    sampleData.add(new RadioModel(false, '9'));
    sampleData.add(new RadioModel(false, '10'));
    sampleData.add(new RadioModel(false, '11'));
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

  @override
  Widget build(BuildContext context) {
    if (cartobjs == null) {
      cartobjs = List<CartObj>();
      updateListview();
    }
    id = widget.id;
    data = widget.data;
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
                            apiURL + data[id]['image']['url'].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                  new Text(data[id]['category'].toString(),
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
                  SizedBox(
                    height: 10,
                  ),
                  new Text("Size",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.blockSizeVertical * 2)),
                  Container(
                    height: 120,
                    child: new GridView.builder(
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: sampleData.length,
                      ),
                      physics: ScrollPhysics(),
                      itemCount: sampleData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new InkWell(
                          //highlightColor: Colors.red,
                          splashColor: Colors.blueAccent,
                          onTap: () {
                            setState(() {
                              sampleData.forEach(
                                  (element) => element.isSelected = false);

                              sampleData[index].isSelected = true;
                              _selectedValue = sampleData[index].buttonText;
                            });
                          },
                          child: new RadioItem(sampleData[index]),
                        );
                      },
                    ),
                  ),
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
                    Text("₹ " + data[id]['price'].toString(),
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
                  for (int i = 0; i < cartobjs.length; i++) {
                      print(cartobjs[i].id);
                      if(data[id]['id']==cartobjs[i].id){
                        return Fluttertoast.showToast(msg: 'Item already exist');
                      }
                    }
                  CartObj cart = CartObj(
                      data[id]['id'],
                      apiURL +
                          data[id]['image']['formats']['thumbnail']['url']
                              .toString(),
                      data[id]['name'].toString(),
                      double.parse(data[id]['price'].toString()),
                      int.parse(_selectedValue),
                      'kg');
                  cartDb.insertCartItem(cart);
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
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      //margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}