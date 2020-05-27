
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        
      // ),
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
        Column(
          
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 37,top: 10),
                  child: Text("Profile",style: TextStyle(
                    fontSize: 30
                  ),
                  ),
                ),
              ],
            ),
            
        Padding(
          padding: const EdgeInsets.only(top: 37,right: 37,left: 37),
          child:
           Container(
            
width: double.infinity,
height: MediaQuery.of(context).size.height/2,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  boxShadow:[BoxShadow(
    color: Colors.black.withOpacity(.2),
    blurRadius: 19
  )] ,
  color: Colors.white
),
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
        Center(
    
      child: Icon(Icons.account_circle,
    
      size: 140,),
    
    ),
    Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text("John Doe",style: TextStyle(fontSize: 20),),
    )
  ],
),
          )
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: <Widget>[
           
              Column(
                children:<Widget>[
               Padding(
                 padding: const EdgeInsets.only(top: 34,left: 21),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     
                     FlatButton(onPressed: (){},
                     child: 
              Text("My orders",style: TextStyle(fontSize: 17),),
              ),
                   ],
                 ),
               ),
                Padding(
          padding: const EdgeInsets.only(right: 37,left: 37),
          child:
           Container(
            
width: double.infinity,
height: 1,
color: Colors.black,
           ),  
                )
          ],
        ),
            Column(
                children:<Widget>[
               Padding(
                 padding: const EdgeInsets.only(left: 21),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     
                     FlatButton(onPressed: (){},
                     child: 
              Text("My Address",style: TextStyle(fontSize: 17),),
              ),
                   ],
                 ),
               ),
                Padding(
          padding: const EdgeInsets.only(right: 37,left: 37),
          child:
           Container(
            
width: double.infinity,
height: 1,
color: Colors.black,
           ),  
                )
          ],
        ),

           Column(
                children:<Widget>[
               Padding(
                 padding: const EdgeInsets.only(left: 21),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     
                     FlatButton(onPressed: (){},
                     child: 
              Text("Logout",style: TextStyle(fontSize: 17),),
              ),
                   ],
                 ),
               ),
                Padding(
          padding: const EdgeInsets.only(right: 37,left: 37),
          child:
           Container(
            
width: double.infinity,
height: 1,
color: Colors.black,
           ),  
                )
          ],
        ),   
          SizedBox(
            height: 15,
          )
        
          ],
        )
      )
    );
  }
}