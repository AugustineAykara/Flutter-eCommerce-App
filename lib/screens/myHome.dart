import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sizeconfig.dart';
import 'cart/cart.dart';
import 'offers.dart';
import 'shoeCategory.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgblack.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6.5,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Explore",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 25,
                          color: Colors.white),
                    ),
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
                  // height: SizeConfig.blockSizeVertical * 4.5,
                  width: double.infinity,
                  child: CupertinoTextField(
                    keyboardType: TextInputType.text,
                    placeholder: 'Search here',
                    placeholderStyle: TextStyle(
                      color: Color(0xffC4C6CC),
                      fontSize: 16.0,
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
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Offers(),
                                ),
                              );
                            },
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 20,
                              //width: width,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  "https://www.gbusiness.in/includes/templates/lacosteshirtsa.co/images/banner.jpg",
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Text(
                                        "No Internet : Check your network connection",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    );
                                  },                                  
                                  fit: BoxFit.fill,
                                ),
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
                height: 500,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: TabBar(
                      tabs: const <Tab>[
                        Tab(icon: Text('Popular')),
                        Tab(icon: Text('Sports')),
                        Tab(icon: Text('Formal')),
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
