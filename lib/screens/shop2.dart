// import 'package:flutter/material.dart';
// // import 'package:my_app/shopoffer.dart';
// import 'message.dart';
// import 'shop1.dart';

// class ShopTwo extends StatefulWidget {
//   static String tag = 'ShopTwo';

//   @override
//   State createState() => new ShopTwoState();
// }

// class ShopTwoState extends State<ShopTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             Container(
//               height: 280,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/shop3.jpg'),
//                       fit: BoxFit.cover)),
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.bottomRight,
//                         colors: [
//                       Colors.black.withOpacity(.6),
//                       Colors.black.withOpacity(.1)
//                     ])),
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                               padding: EdgeInsets.symmetric(vertical: 3),
//                               margin: EdgeInsets.symmetric(horizontal: 40),
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                               ),
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     prefixIcon: Icon(Icons.search),
//                                     hintText: 'Search'),
//                               )),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             MyApp(),
//             new FootListView(),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               height: 5,
//               color: Colors.black,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "All Category",
//               style: TextStyle(fontFamily: 'BreeSerif', fontSize: 25),
//             ),
//             new SelectTypeSelection(),
//             SizedBox(
//               height: 20,
//             ),
//             new MenuItemList(),
//             SelectTypePant()
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MenuItemList extends StatelessWidget {
//   const MenuItemList({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[],
//       ),
//     );
//   }
// }

// class SelectTypeSelection extends StatelessWidget {
//   const SelectTypeSelection({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Container(
//         height: 250,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             new ItemCard(
//                 'assets/mat1.jpg', 'Rs 450', 'get it', 'assets/mat1.jpg'),
//             ItemCard('assets/mat2.jpg', 'Rs 410', 'get it', 'assets/mat2.jpg'),
//             ItemCard('assets/mat1.jpg', 'Rs 300', 'get it', 'assets/mat1.jpg'),
//             ItemCard('assets/mat2.jpg', 'Rs 456', 'get it', 'assets/mat2.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SelectTypePant extends StatelessWidget {
//   const SelectTypePant({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Container(
//         height: 250,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             new ItemCard(
//                 'assets/mat1.jpg', 'Rs 450', 'get it', 'assets/mat1.jpg'),
//             ItemCard('assets/mat2.jpg', 'Rs 410', 'get it', 'assets/mat2.jpg'),
//             ItemCard('assets/mat1.jpg', 'Rs 300', 'get it', 'assets/mat1.jpg'),
//             ItemCard('assets/mat2.jpg', 'Rs 456', 'get it', 'assets/mat2.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FootListView extends StatelessWidget {
//   const FootListView({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   IconButton(
//                     onPressed: () {
//                       // Navigator.of(context).pushNamed(Offer.tag);
//                     },
//                     icon: Icon(Icons.local_offer),
//                     color: Colors.blue,
//                   ),
//                   Text(
//                     'Our offers',
//                     style: TextStyle(
//                       fontFamily: 'Calistoga',
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 children: <Widget>[
//                   IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed(Message.tag);
//                     },
//                     icon: Icon(Icons.message),
//                     color: Colors.blue,
//                   ),
//                   Text(
//                     'Message',
//                     style: TextStyle(
//                       fontFamily: 'Calistoga',
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.directions_bike),
//                 color: Colors.blue,
//               ),
//               Text(
//                 "35 min",
//                 style: TextStyle(fontFamily: 'Calistoga', fontSize: 14),
//               ),
//             ],
//           ),
//           Column(children: <Widget>[
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.star),
//               color: Colors.orange,
//             ),
//             Text(
//               "4.2 rating",
//               style: TextStyle(fontFamily: 'Calistoga', fontSize: 14),
//             ),
//           ])
//         ],
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 10,
//     );
//   }
// }

// class ItemCard extends StatelessWidget {
//   final String img;
//   final String price;
//   final String title;

//   final String img1;
//   ItemCard(this.img, this.price, this.title, this.img1);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(new MaterialPageRoute(
//             builder: (context) =>
//                 new MaterialOne(this.img, this.price, this.title)));
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 9.0),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: 280,
//               width: 250,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   image: DecorationImage(
//                       image: AssetImage(this.img), fit: BoxFit.fill)),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             SizedBox(height: 10),
//                             Text(
//                               this.price,
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontFamily: 'BreeSerif',
//                                   fontSize: 37),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 130,
//                     ),
//                     Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: <Widget>[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Text(
//                                   this.title,
//                                   style: TextStyle(
//                                       color: Colors.blue,
//                                       fontFamily: 'Calistoga',
//                                       fontSize: 30),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               print("Add to favourite");
//                             },
//                             icon: Icon(
//                               Icons.favorite,
//                               size: 35,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
