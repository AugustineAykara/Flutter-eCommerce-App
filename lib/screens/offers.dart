import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  State createState() => new OffersState();
}

class OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Offers",
                style: TextStyle(fontFamily: 'Calistoga', fontSize: 20),
              ),
              SizedBox(height: 50),
              Center(
                child: Icon(
                  Icons.local_offer,
                  size: 180,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Not Available right now",
                style: TextStyle(fontFamily: 'Calistoga', fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
