
import 'dart:convert';

import 'package:flutter/material.dart';
import '../sizeconfig.dart';
import 'package:http/http.dart' as http;
import 'productpage.dart';


class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => new _PopularPageState();
}

class _PopularPageState extends State<PopularPage>{

  List data;

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
    return new GridView.builder(
                          itemCount: 4,
                          physics: ScrollPhysics(),
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return new BodyWidget(data, index);
                        },
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
                padding: const EdgeInsets.symmetric(horizontal:10.0),
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
          Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => ProductPage()),
          );
        });
  }
}

