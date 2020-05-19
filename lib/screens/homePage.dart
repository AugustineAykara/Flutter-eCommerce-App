// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:my_app/user.dart';
// import 'auth.dart';
// import 'page1.dart';
// import 'page2.dart';
// import 'page3.dart';
// import 'page4.dart';
// import 'auth.dart';

// class Home extends StatefulWidget {
//   static String tag = 'home';
  
//   @override
// State createState() => new HomeState();
// }

  

// class HomeState extends State<Home>{
//   final AuthSerivce _auth = AuthSerivce();

//   int _currentIndex =0;
//   Widget callPage(int currentIndex){
// switch(currentIndex) {
//    case 0: return PageOne();
//    case 1: return PageTwo();
//    case 2: return PageThree();
//    case 3: return PageFour();
   

//    break;
//    default:return PageOne();
// }
//   }
// Icon cusIcon = Icon(Icons.search,color: Colors.white);
// Widget cusSearchBar = Text("Shop now",style: 
// TextStyle(
//   fontFamily: 'Calistoga',
//   color: Colors.white,

// ),);
//   @override
//   Widget build(BuildContext context){
    
//     return new Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//           titleSpacing: 10,
//           title: 
//           cusSearchBar,
//           backgroundColor: Colors.deepPurple,
          
//           actions: <Widget>[
            
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   new IconButton(icon: cusIcon,
//             onPressed: (){
//                   setState(() {
//                     if(this.cusIcon.icon == Icons.search){
//                       this.cusIcon=Icon(Icons.cancel,color: Colors.white,);
//                       this.cusSearchBar=TextField(
//                         cursorColor: Colors.black,
                        
//                         textInputAction: TextInputAction.go,
//                         decoration: InputDecoration(
                         
//                           hintText: "search",
                        
//                            prefixIcon: new Icon(Icons.search,color: Colors.white,),
//                         ),
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16
//                         ),

//                       );

//                     }
//                     else{
                      
//                       this.cusIcon = Icon(Icons.search,color: Colors.white);
//                         this.cusSearchBar = Text("Shop now",style: 
//                         TextStyle(color: Colors.white,
//                         fontFamily: 'Calistoga',
//                         letterSpacing: .4,
//                         fontSize: 23)
//                         ,);

//                     }
//                   }
//                   );
//             },),
//                 ],
//               ),
           
          
//           ],
        
//         ),
      
      

//       drawer: new Drawer(
        
//         child: new ListView(
//           children: <Widget>[
          
//             new UserAccountsDrawerHeader(
//               accountName: Text("name")  ,
//             accountEmail: Text("user@gmail.com"),
//             currentAccountPicture: GestureDetector(
//               child: new CircleAvatar(
//                 backgroundColor: Colors.lightBlue,
//                 child: Icon(Icons.person, color: Colors.white,
//                 size: 60,),
//               ),
//             ),
//             decoration: new BoxDecoration(
//               color: Colors.deepPurple
//             ),
//             ),
//   //          body
  
//   InkWell(
//     onTap: (){},
//       child: ListTile(
//       title: Text("My Account"),
//       leading: Icon(Icons.person,color: Colors.red,),
//     ),
//   ),
//   InkWell(
//     onTap: (){},
//       child: ListTile(
//       title: Text("My order"),
//       leading: Icon(Icons.shopping_basket,color: Colors.green,),
//     ),
//   ),
  
  
//    InkWell(
//     onTap: (){
    
//     },
//       child: ListTile(
//       title: Text("Help & Feedback"),
//       leading: Icon(Icons.feedback,color: Colors.red,),
//     ),
//   ),
//    InkWell(
//     onTap: (){},
//       child: ListTile(
//       title: Text("About"),
//       leading: Icon(Icons.help,color: Colors.lightBlue,),
//     ),
//   ),
//    InkWell(
//     onTap: (){},
//       child: ListTile(
//       title: Text("Settings"),
//       leading: Icon(Icons.settings,color: Colors.grey,),
//     ),
//   ),
//    InkWell(
//     onTap: ()async{
// await _auth.signOut();
//     },
//       child: ListTile(
//       title: Text("log out"),
//       leading: Icon(Icons.person,color: Colors.red,),
//     ),
//   ),
//           ],
//         ),
//       ),
//       body: 
//       Container(
//         child: callPage(_currentIndex
          
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//         icon: Icon(Icons.home ,color: Colors.white,),
//         title: Text("Home",style: TextStyle(
//           fontFamily: 'BreeSerif',
//           color: Colors.white
//         ),
//         ),
//         backgroundColor: Colors.deepPurple,
//           ),
//           BottomNavigationBarItem(
//         icon: Icon(Icons.local_offer,color: Colors.white,
//         ),
//         title: Text("Offers",style: TextStyle(
//           fontFamily: 'BreeSerif',
//           color: Colors.white
//         ),),
//         backgroundColor: Colors.deepPurple,
//           ),
//           BottomNavigationBarItem(
//         icon: Icon(Icons.favorite),
//         title: Text("Favourite",style: TextStyle(
//           fontFamily: 'BreeSerif',
//           color: Colors.white
//         ),),
      
//         backgroundColor: Colors.deepPurple,),
//         BottomNavigationBarItem(
//         icon: Icon(Icons.shopping_cart),
//         title: Text("My cart",style: TextStyle(
//           fontFamily: 'BreeSerif',
//           color: Colors.white
//         ),),
//         backgroundColor: Colors.deepPurple,)
//         ],
//         onTap: (intex){
// setState(() {
//   _currentIndex=intex;
// });if(intex==2){
  
// }
//         },
//       ),
    
      
//     );
// }
// }