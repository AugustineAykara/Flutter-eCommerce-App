import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_app/shop3.dart';
// import 'location.dart';
import 'shop1.dart';
import 'shop2.dart';
import 'package:http/http.dart' as http;
import '../sizeconfig.dart';
import '../account/login.dart';

class MyHome extends StatefulWidget {
  static String tag = 'MyHome';

  @override
  State createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List data;
  final FirebaseAuth auth = FirebaseAuth.instance;

  userSignout() async {
    await auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  Future<String> getJsonData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/albums"),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      if (this.mounted) {
        var converDataToJson = jsonDecode(response.body);
        data = converDataToJson;
        //print(data[0]);

        return "Success";
      }
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 15),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Browse",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: height / 30),
                      ),
                      IconButton(
                          icon: Icon(Icons.shopping_cart), onPressed: null)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 4.5,
                    width: double.infinity,
                    child: CupertinoTextField(
                      keyboardType: TextInputType.text,
                      placeholder: 'Search here',
                      placeholderStyle: TextStyle(
                        color: Color(0xffC4C6CC),
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                      ),
                      prefix: Padding(
                        padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xffC4C6CC),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 20,
                            //width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzYEl6iQxZLInQQsxvZtpJR3dtD93D3_GybSMMM3B-J8fSGkL57g&s",
                              //data[index]['event_poster'],
                              //height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: SizeConfig.blockSizeVertical * 55,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: TabBar(
                      tabs: const <Tab>[
                        Tab(icon: Text('Popular')),
                        Tab(icon: Text('Sports')),
                        Tab(icon: Text('Formal')),
                      ],
                      labelColor: Colors.blue[800],
                      unselectedLabelColor: Colors.grey,
                      isScrollable: false,
                      indicatorColor: Colors.blue[800],
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        new GridView.builder(
                          itemCount: 4,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return new BodyWidget(data, index);
                          },
                        ),
                        new Container(
                          height: 200,
                          color: Colors.black,
                        ),
                        new Container(
                          height: 200,
                          color: Colors.black,
                        ),
                        // new Text("jnjkhnjhjm"),
                        // new Text("jnjk"),
                        // _buildEvent(),
                        // _displayPlayers(),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // Container(

          //     // height: height,
          //     child: SliverGrid(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 0.9,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return BodyWidget(data, index);
          //     },
          //     childCount: 4,
          //   ),
          // )),
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("name"),
              accountEmail: Text("user@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blue[800]),
            ),
            //          body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My order"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.green,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Help & Feedback"),
                leading: Icon(
                  Icons.feedback,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                // await _auth.signOut();
              },
              child: ListTile(
                title: Text("log out"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                onTap: () {
                  userSignout();
                },
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   child: ListView(
      //     children: <Widget>[
      //       Container(
      //         height: 240,
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 image: AssetImage('assets/app.jpg'), fit: BoxFit.cover)),
      //         child: Container(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: <Widget>[
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: <Widget>[
      //                     Column(children: <Widget>[
      //                       Text(
      //                         "Your Location",
      //                         style: TextStyle(
      //                             fontFamily: 'BreeSerif', fontSize: 14),
      //                       ),
      //                       Text(
      //                         'xxxxx',
      //                         style: TextStyle(
      //                           fontSize: 15,
      //                           fontFamily: 'Calistoga',
      //                         ),
      //                       ),
      //                       RaisedButton(
      //                         onPressed: () {
      //                           //  Navigator.of(context).pushNamed(Location.tag);
      //                         },
      //                         color: Colors.blue,
      //                         child: Text('Change',
      //                             style: TextStyle(
      //                               fontFamily: 'BreeSerif',
      //                             )),
      //                       )
      //                     ]),
      //                     IconButton(
      //                       icon: Icon(Icons.notifications),
      //                       onPressed: () {},
      //                       color: Colors.orange,
      //                       iconSize: 35,
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       MyApp(),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       new FootListView(),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         height: 2,
      //         color: Colors.black,
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       new SelectTypeSelection(),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       new MenuItemList()
      //     ],
      //   ),
      // ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  List data;
  int index;
  BodyWidget(data, index) {
    this.data = data;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(width / 25),
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          //margin: EdgeInsets.all(8),

          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.bottomRight,
                  child: new Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: Colors.blue[800],
                    ),
                    child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white, size: 15),
                        onPressed: null),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 12,
                      //width: SizeConfig.blockSizeHorizontal * 20,
                      child: Image.network(
                        "https://www.searchpng.com/wp-content/uploads/2019/01/Nike-Shoe-PNG-715x715.png",
                        //data[index]['event_poster'],
                        //height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Nike",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Rs. 4000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          // MaterialPageRoute(builder: (context) => CategoryPage()),
          // );
        });
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
