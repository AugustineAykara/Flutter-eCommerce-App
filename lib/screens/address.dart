import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
          child: Scaffold(
        
       body: SingleChildScrollView(
                child: Stack(
           children: <Widget>[
             Container(
               height: MediaQuery.of(context).size.height*0.65,
               width: double.infinity,
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(60),
                     bottomRight: Radius.circular(60)
                   )
                 ),
               ), 
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("My Address",style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      
                    ),),
                  ],
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(top: 30),
                     child: Container(
          
width: MediaQuery.of(context).size.width/1.15,
height: MediaQuery.of(context).size.height/1.35,

 decoration: BoxDecoration(
 borderRadius: BorderRadius.circular(28),
    boxShadow:[BoxShadow(
   color: Colors.black.withOpacity(.8),
    blurRadius: 8
 )] ,
color: Colors.white
 ),
 child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
   children: <Widget>[
     
Padding(
  padding: const EdgeInsets.only(top: 10),
  child:   TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box,
        color: Colors.blueAccent,),
        labelText: 'name',
       contentPadding: EdgeInsets.only(bottom: 18)
      ),
    )
),


Padding(
  padding: const EdgeInsets.only(top: 10),
  
    child:   TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home,
        color: Colors.blueAccent,),
        labelText: 'Hose Name',
        contentPadding: EdgeInsets.only(bottom: 18)
      ),
    ),
),


Padding(
  padding: const EdgeInsets.only(top: 10),
    child:   TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        
        prefixIcon: Icon(Icons.location_city,
        color: Colors.blueAccent,),
        labelText: 'City',
        contentPadding: EdgeInsets.only(bottom: 18)
      ),
    ),
  
  
),
Padding(
  padding: const EdgeInsets.only(top: 10),
    child:   TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        
        prefixIcon: Icon(Icons.public,
        color: Colors.blueAccent,),
        labelText: 'State',
        contentPadding: EdgeInsets.only(bottom: 18)
      ),
    ),
  

),
Padding(
  padding: const EdgeInsets.only(top: 10),
    child:   TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.pin_drop,
        color: Colors.blueAccent,),
        labelText: 'PIN',
        contentPadding: EdgeInsets.only(bottom: 18)
      ),
    ),
),
Padding(
  padding: const EdgeInsets.only(top: 10),
  child:   RaisedButton(
  
    onPressed: (){},
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18)
  ),
    child: Text("Save",style: TextStyle(
  
      color: Colors.white,
  
      fontSize: 20
  
    ),),
  
    color: Colors.blueAccent,
  splashColor: Colors.lightBlue,
   ),
)
   ],
 ),
                     ),
                   )
                  
                ],
              ),
              SizedBox(
                height: 15,
              )
               ],
             )
           ],
         ),
       ),
      ),
    );
  }
}