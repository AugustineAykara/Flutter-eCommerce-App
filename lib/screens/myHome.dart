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

          //color: Colors.white,
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
                                  //data[index]['event_poster'],
                                  //height: 30,
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
    );
  }
}

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
//         children: <Widget>[
//           Text(
//             "Popular Shops Near You",
//             style: TextStyle(
//                 fontFamily: 'Calistoga', letterSpacing: .3, fontSize: 18),
//           ),
//           Text(
//             "4 Found",
//             style: TextStyle(
//                 fontFamily: 'BreeSerif',
//                 letterSpacing: .3,
//                 fontSize: 16,
//                 color: Colors.grey),
//           ),
//           SizedBox(height: 30),
//           MenuItems("STUDIO21", "4.7", 'assets/shop1.jpg', ShopOne.tag,
//               'mens shopping', '48 min'),
//           SizedBox(
//             height: 15,
//           ),
//           MenuItems("Fashion", "4.2", 'assets/shop3.jpg', ShopTwo.tag,
//               'Ladies wear', '35 min'),
//           SizedBox(
//             height: 15,
//           ),
//           //  MenuItems("ARMAAN","4.1",'assets/shop2.png',ShopThree.tag,'all type wears','30 min'),
//           SizedBox(
//             height: 15,
//           ),

//           MenuItems(
//               "DUD", "3.8", 'assets/shop5.jpg', '', 'Mens wearing', '50 min'),
//         ],
//       ),
//     );
//   }
// }

// class MenuItems extends StatelessWidget {
//   final String shop;
//   final String rate;
//   final String img;
//   final String page;
//   final String type;
//   final String time;

//   MenuItems(this.shop, this.rate, this.img, this.page, this.type, this.time);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).pushNamed(this.page);
//       },
//       child: Container(
//         height: 150,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, 15),
//             ),
//             BoxShadow(
//                 color: Colors.black12, offset: Offset(0, 13), blurRadius: 10),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 150,
//               width: 125,
//               child: Image(
//                 image: AssetImage(this.img),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(width: 1),
//             Container(
//               height: 139,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 7,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                               width: 173,
//                               child: Text(
//                                 this.shop,
//                                 style: TextStyle(
//                                     fontFamily: 'Calistoga', fontSize: 20),
//                               )),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Text(this.type),
//                           SizedBox(
//                             height: 26,
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Icon(Icons.timer),
//                               Text(this.time),
//                               SizedBox(width: 45),
//                               Container(
//                                 color: Colors.white,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 8, vertical: 4),
//                                   child: Row(children: <Widget>[
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.orange,
//                                     ),
//                                     Text(this.rate),
//                                   ]),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
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
//             new ItemCard('assets/offer1.jpg', '25% discount', 'STUDIO21'),
//             ItemCard('assets/offer2.jpg', '50% discount', 'ARMAAN'),
//             ItemCard('assets/offer4.jpg', 'big deal', 'FASHION'),
//             ItemCard('assets/offer5.jpg', 'big deal', 'ARMAAN'),
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
//         children: <Widget>[
//           Text(
//             "Amazing Offers Near You",
//             style: TextStyle(
//                 fontFamily: 'Calistoga', letterSpacing: .3, fontSize: 18),
//           ),
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
//   final String offer;
//   final String sub;
//   ItemCard(this.img, this.offer, this.sub);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(new MaterialPageRoute(
//             builder: (context) =>
//                 new MaterialOne(this.img, this.offer, this.sub)));
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 9.0),
//         child: Container(
//             height: 280,
//             width: 250,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                     image: AssetImage(this.img), fit: BoxFit.fill)),
//             child: Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Spacer(),
//                       Text(
//                         this.offer,
//                         style: TextStyle(
//                             color: Colors.red,
//                             fontFamily: 'BreeSerif',
//                             fontSize: 29),
//                       ),
//                       Text(
//                         this.sub,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'BreeSerif',
//                             color: Colors.red),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }
