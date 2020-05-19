  import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  
  @override
   State createState() => new PageTwoState();
}

  

class PageTwoState extends State<PageTwo>{
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
              Text("Offers",style: 
                                TextStyle(
                                  fontFamily: 'Calistoga',
                                  fontSize: 20
                                ),),
              SizedBox(height: 50),
              Center(child: Icon(Icons.local_offer,size: 180,color: Colors.grey,)
              ,),
              SizedBox(
                height: 20,
              ),
              Text("Not Available right now",style: 
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