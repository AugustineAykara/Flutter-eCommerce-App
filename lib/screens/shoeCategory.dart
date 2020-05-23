import 'dart:convert';
import 'package:flutter/material.dart';
import '../sizeconfig.dart';
import 'package:http/http.dart' as http;
import 'productpage.dart';

class ShoeCategory extends StatefulWidget {
  final String category;
  ShoeCategory({Key key, this.category}) : super(key: key);

  @override
  _ShoeCategoryState createState() => new _ShoeCategoryState();
}

class _ShoeCategoryState extends State<ShoeCategory> {
  List data;

  Future<String> getJsonData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://flutter-shopmate.herokuapp.com/" + widget.category),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      if (this.mounted) {
        var converDataToJson = jsonDecode(response.body);
        data = converDataToJson;
        print(data.length);
        //print(converDataToJson);
        return ("Success");
      }
    }
    return (null);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: getJsonData(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: new GridView.builder(
                itemCount: data == null ? 0 : data.length,
                physics: ScrollPhysics(),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return new BodyWidget(data, index);
                },
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text("Loading...")
              ],
            );
          }
        });
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 12,
                    //width: SizeConfig.blockSizeHorizontal * 20,
                    child: Image.network(
                      "https://flutter-shopmate.herokuapp.com" +
                          data[index]['image']['url'].toString(),
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
                      Text(data[index]['name'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: height / 50)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("₹ " + data[index]['price'].toString(),
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
          MaterialPageRoute(
            builder: (context) => ProductPage(
              id: index,
              data: data,
            ),
          ),
        );
      },
    );
  }
}
