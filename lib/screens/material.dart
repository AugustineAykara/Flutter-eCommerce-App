import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MaterialOne extends StatefulWidget{
    static String tag = 'MaterialOne';

  @override
  State createState() => new MaterialOneState('','','','');
}
class Size {
  int id;
  String name;
  Size(this.id,this.name);
  static List<Size> getSize(){
    return <Size>[
      Size(1,'Small'),
      Size(2,"Large"),
      Size(3,'medium')
    ];
  }
}
class MaterialOneState extends State<MaterialOne>{
  final String img;
   final String shop;
   final String about;
    final String price;
List<Size>_sizes=Size.getSize();
List<DropdownMenuItem<Size>> _dropdownmenuitem;
Size _selectdSize;

  MaterialOneState(this.img,this.shop,this.about,this.price);

@override
void initState(){
_dropdownmenuitem = buildDropDownMenuItem(_sizes);
_selectdSize = _dropdownmenuitem[0].value;
super.initState();
}
List<DropdownMenuItem<Size>>buildDropDownMenuItem(List sizes){
List<DropdownMenuItem<Size>> items =List();
for(Size size in sizes){
  items.add(DropdownMenuItem(value: size,
  child: Text(size.name),)
  );
}
return items;
}
onChangedDropDownItem(Size selectedsize){
  setState(() {
    _selectdSize=selectedsize;
  });
}

  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Shop"),
    ),
    body: 
    
    Container(
            child: ListView(
              children: <Widget>[
          Container(
          height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(this.img),
                fit: BoxFit.cover
              )
            ),

    ),
    Container(
      child: SizedBox(
        height: 19,
      ),
    ),
           Container(
             color: Colors.red,
             height: 46,
             child: Padding(
               padding: const EdgeInsets.all(13.0),
               child: Text(this.shop),
             ),
           ),
           SizedBox(
             height: 10,
           ),
           Container(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(bottom: 30),
                         child: Container
                         (child: Text(this.about)),
                       ),
                      
                       Text(this.price),
                      
                     ],
                   ),
                   Column(
                     
                     children: <Widget>[
                       Text("Available SIZES"),
                     
                  

                     DropdownButton(
                       value: _selectdSize,
                       items: _dropdownmenuitem,
                       onChanged: onChangedDropDownItem,
                     ),
                     Text('selected size: ${_selectdSize.name}'),
                     ]
                   )
                 ],
               ),
             ),
           ),
          Container(
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                 
                  color: Colors.orange,
                  child: Text("Buy Now"),
                  onPressed: (){},
                ),
              FlatButton(
                  child: Text("Add To Cart"),
                  onPressed: (){},
              )
              ],
            ),
          )
           
              ]
            )
    
    ),
   
    );
    
            
    }}

   