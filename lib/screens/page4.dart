  import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  
  @override
   State createState() => new PageFourState();
}

  

class PageFourState extends State<PageFour>{
 @override
  Widget build(BuildContext context){
    
    return new Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your cart",style: 
                                TextStyle(
                                  fontFamily: 'Calistoga',
                                  fontSize: 20
                                ),),
              SizedBox(height: 50),
              Center(child: Icon(Icons.add_shopping_cart,size: 180,color: Colors.grey,)
              ,),
              SizedBox(
                height: 20,
              ),
              Text("Your Cart Is Empty",style: 
                                TextStyle(
                                  fontFamily: 'Calistoga',
                                  fontSize: 20
                                ),)
            ],
          )
        ],
      ),
    );
}
}