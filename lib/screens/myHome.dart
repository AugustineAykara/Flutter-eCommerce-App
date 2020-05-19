import 'package:flutter/material.dart';
// import 'package:my_app/shop3.dart';
// import 'location.dart';
import 'shop1.dart';
import 'shop2.dart';

class MyHome extends StatefulWidget {
  static String tag = 'MyHome';

  @override
  State createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/app.jpg'), fit: BoxFit.cover)),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Text(
                              "Your Location",
                              style: TextStyle(
                                  fontFamily: 'BreeSerif', fontSize: 14),
                            ),
                            Text(
                              'xxxxx',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Calistoga',
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                //  Navigator.of(context).pushNamed(Location.tag);
                              },
                              color: Colors.blue,
                              child: Text('Change',
                                  style: TextStyle(
                                    fontFamily: 'BreeSerif',
                                  )),
                            )
                          ]),
                          IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () {},
                            color: Colors.orange,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            MyApp(),
            SizedBox(
              height: 10,
            ),
            new FootListView(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            new SelectTypeSelection(),
            SizedBox(
              height: 20,
            ),
            new MenuItemList()
          ],
        ),
      ),
    );
  }
}

class MenuItemList extends StatelessWidget {
  const MenuItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Popular Shops Near You",
            style: TextStyle(
                fontFamily: 'Calistoga', letterSpacing: .3, fontSize: 18),
          ),
          Text(
            "4 Found",
            style: TextStyle(
                fontFamily: 'BreeSerif',
                letterSpacing: .3,
                fontSize: 16,
                color: Colors.grey),
          ),
          SizedBox(height: 30),
          MenuItems("STUDIO21", "4.7", 'assets/shop1.jpg', ShopOne.tag,
              'mens shopping', '48 min'),
          SizedBox(
            height: 15,
          ),
          MenuItems("Fashion", "4.2", 'assets/shop3.jpg', ShopTwo.tag,
              'Ladies wear', '35 min'),
          SizedBox(
            height: 15,
          ),
          //  MenuItems("ARMAAN","4.1",'assets/shop2.png',ShopThree.tag,'all type wears','30 min'),
          SizedBox(
            height: 15,
          ),

          MenuItems(
              "DUD", "3.8", 'assets/shop5.jpg', '', 'Mens wearing', '50 min'),
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  final String shop;
  final String rate;
  final String img;
  final String page;
  final String type;
  final String time;

  MenuItems(this.shop, this.rate, this.img, this.page, this.type, this.time);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(this.page);
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 15),
            ),
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 13), blurRadius: 10),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              width: 125,
              child: Image(
                image: AssetImage(this.img),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 1),
            Container(
              height: 139,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 173,
                              child: Text(
                                this.shop,
                                style: TextStyle(
                                    fontFamily: 'Calistoga', fontSize: 20),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Text(this.type),
                          SizedBox(
                            height: 26,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.timer),
                              Text(this.time),
                              SizedBox(width: 45),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(this.rate),
                                  ]),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectTypeSelection extends StatelessWidget {
  const SelectTypeSelection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new ItemCard('assets/offer1.jpg', '25% discount', 'STUDIO21'),
            ItemCard('assets/offer2.jpg', '50% discount', 'ARMAAN'),
            ItemCard('assets/offer4.jpg', 'big deal', 'FASHION'),
            ItemCard('assets/offer5.jpg', 'big deal', 'ARMAAN'),
          ],
        ),
      ),
    );
  }
}

class FootListView extends StatelessWidget {
  const FootListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Text(
            "Amazing Offers Near You",
            style: TextStyle(
                fontFamily: 'Calistoga', letterSpacing: .3, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}

class ItemCard extends StatelessWidget {
  final String img;
  final String offer;
  final String sub;
  ItemCard(this.img, this.offer, this.sub);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) =>
                new MaterialOne(this.img, this.offer, this.sub)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 9.0),
        child: Container(
            height: 280,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(this.img), fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Text(
                        this.offer,
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'BreeSerif',
                            fontSize: 29),
                      ),
                      Text(
                        this.sub,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'BreeSerif',
                            color: Colors.red),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
