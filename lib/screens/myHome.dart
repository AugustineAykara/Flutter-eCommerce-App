import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sizeconfig.dart';
import 'cart/cart.dart';
import 'shoeCategory.dart';
import '../SABT.dart';

class MyHome extends StatefulWidget {
  static String tag = 'MyHome';

  @override
  State createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220.0,
            backgroundColor: Colors.black,
            floating: false,
            pinned: true,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
            )),
            //leading: new Container(),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
                title: SABT(
                  child: Text(
                    "Shopmate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                background: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/images/bgblack.png")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 8,
                              ),
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    "Explore",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: height / 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  new Text(
                                    "Your favourite shoes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: height / 40,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 40,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        9.0, 6.0, 9.0, 6.0),
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
                      ],
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 60),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 180,
                            //width: width,
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/banner.gif',
                                fit: BoxFit.fill,
                              ),
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
                height: 700,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: TabBar(
                      tabs: const <Tab>[
                        Tab(
                          icon: Text(
                            'Popular',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Sports',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Formal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: false,
                      indicatorColor: Colors.black,
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        ShoeCategory(category: "popular"),
                        ShoeCategory(category: "sports"),
                        ShoeCategory(category: "formals"),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
