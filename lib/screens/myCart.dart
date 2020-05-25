import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  State createState() => new MyCartState();
}

class MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Icon(
            Icons.add_shopping_cart,
            // size: 180,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

// return new Container(
//       color: Colors.white,
//       child: ListView(
//         children: <Widget>[
//           SizedBox(
//             height: 30,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "Your cart",
//                 style: TextStyle(fontFamily: 'Calistoga', fontSize: 20),
//               ),
//               SizedBox(height: 50),
//               Center(
//                 child: Icon(
//                   Icons.add_shopping_cart,
//                   size: 180,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Your Cart Is Empty",
//                 style: TextStyle(fontFamily: 'Calistoga', fontSize: 20),
//               )
//             ],
//           )
//         ],
//       ),
//     );
