


import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

PageController pagecontroller;

  @override
  void initState(){
    super.initState();
    pagecontroller = PageController(viewportFraction: 0.8);
      }

      @override
      void dipose(){
        pagecontroller.dispose();
        super.dispose();
      }

  @override
  Widget build(BuildContext context) {
    Widget image = new Container(
      height: MediaQuery.of(context).size.height/2.9,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("assets/image.jpg"),
           AssetImage("assets/ima.jpg"),
            AssetImage("assets/imag.jpg"),
             AssetImage("assets/images.jpg"),
              
        ],
        autoplay: false,

        
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
    
     body:ListView(
       
       children: <Widget>[
      
         image,
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Text("TOP TRENDING",
           style:TextStyle(fontFamily: "Calistoga",fontSize: 25,color: Colors.black) ,),
         ),
           SizedBox(
            
      height: MediaQuery.of(context).size.height * 0.65,  //<-- set height of the card
      child: PageView(
        controller: pagecontroller,
              children:<Widget>[
                CarouselSlider(items:[Slidcard(name: "WRONG", sub: "Men green Sneakers", assetName: "ind.jpg"),Slidcard(name: "", sub: "Men black sneakers", assetName: "in.jpg"),Slidcard(name: "ROADESTER", sub: "Men taupe sneaker",assetName: "inde.jpg"),].map((i){
                  return Builder(
                    builder: (BuildContext context){
                      return i;   
                          
                    });
                }).toList(),
                 options: CarouselOptions(
                   height: 400,
                   enableInfiniteScroll:false,
                   enlargeCenterPage: true
                 ))
        //         Slidcard(
        //    name: 'WROGN',
        //   sub: 'Men Olive Green Sneakers',
        //   assetName: 'in.jpg',
        // ),
        //   Slidcard(
        //    name: 'WROGN', 
              ]
      ),
           ),
       ],
     ),
    );
    
    }
    }

    class Slidcard extends StatelessWidget {
      final String name; //<-- title of the event
  final String sub; 
  final String assetName; //<-- name of the image to be displayed

  const Slidcard({
    Key key,
    @required this.name,
    @required this.sub,
    @required this.assetName,
  }) : super(key: key);
     @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)), //<--custom shape
      child: Column(
        children: <Widget>[
          ClipRRect(  //<--clipping image
     borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
            child: Image.asset( //<-- main image
              'assets/$assetName',
              height: MediaQuery.of(context).size.height * 0.324,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.008),
          Expanded(
            child: CardContent(sub: '$sub',name: '$name',), //<-- will be replaced soon :)
          ),
        ],
      ),
    );
  }
    }
Color _iconcolor = Colors.grey;

    class CardContent extends StatelessWidget {
  final String name;
  final String sub;

  const CardContent({Key key, @required this.name, @required this.sub})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text(sub, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Row(
            children: <Widget>[
            IconButton(
              icon:Icon(Icons.favorite,
              size: 35,
              color: _iconcolor,
              ) ,
               onPressed: (){
               
               }
               ),
              
              Spacer(),
              Text(
                '0.00 \$',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}