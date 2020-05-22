import 'package:flutter/material.dart';
import '../sizeconfig.dart';

class ProductPage extends StatefulWidget {
  @override
  State createState() => new ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
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
                            "https://www.searchpng.com/wp-content/uploads/2019/01/Nike-Shoe-PNG-715x715.png",
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
              child: Row(
                children: <Widget>[
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40,),
                      new Text("Nike Air",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.blockSizeVertical * 4)),
                      new Text("Sports Shoe",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeVertical * 2)),
                      SizedBox(height: 10,),
                      new Text("Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.blockSizeVertical * 2)),
                      new Text("Made with quality by Nike",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeVertical * 2)),
                    ],
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
                    Text("Rs.4000",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              RaisedButton(
                elevation: 1,
                color: Colors.deepOrange,
                onPressed: () {
                  // //model.addCart(widget.detail);
                  // Timer(Duration(milliseconds: 500), (){
                  //   showCartSnak(model.cartMsg,model.success);
                  // });
                  //cartDb.insertCartItem(cart);
                  //cart.id += 1;
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
