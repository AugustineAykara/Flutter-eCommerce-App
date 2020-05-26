import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'cartModel.dart';
//import '../../wrapper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class CartDb {

  static CartDb _cartDb;
  static Database _database;

  String cartTable = 'Cart_Table';
  String colid = 'id';
  String colname = 'name';
  String colprice = 'price';
  String colimage = 'image';
  String colquantity = 'quantity';
  String colrepresentation = 'representation';

   

  CartDb._createinstance(); 

  factory CartDb () {
    if(_cartDb == null){
      _cartDb = CartDb._createinstance();
    }
    return _cartDb;
  }

 Future<Database> get database async{
    if(_database == null){
      _database = await initialseDb();
    }
    return _database;
  }

  Future<Database>initialseDb() async{
    Directory directory = await  getApplicationDocumentsDirectory();
    String path = directory.path + 'cartdata';

    var cartdatabase = openDatabase(path,version:1,onCreate: _createDB);
    return cartdatabase;
  }

  void _createDB(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $cartTable($colid INTEGER PRIMARY KEY,$colname TEXT,$colprice FLOAT,$colimage TEXT, $colquantity NUMBER,$colrepresentation TEXT)');
  }

  //FETCHING ALL CART OBJECTS

  Future<List<Map<String,dynamic>>>getCartMapList() async{
    Database db  = await this.database;
    var result = await db.query(cartTable);
    return result;
  }

  //INSERTING INTO CART

  Future<int> insertCartItem(CartObj cartObj) async{
    Database  db = await this.database;
    var result = await db.insert(cartTable, cartObj.toMap());
    Fluttertoast.showToast(msg: 'Added to Cart');
    return result;
  }

  //UPDATE CART ITEM
  Future<int> updateCartItem(CartObj cartObj) async{
    Database  db = await this.database;
    var result = await db.update(cartTable, cartObj.toMap(),where: '$colid = ?', whereArgs: [cartObj.id]);
    return result;
  }

  //DELETE CART ITEM

  Future<int> deleteCartItem(int id) async{
    Database  db = await this.database;
    var result = await db.rawDelete('DELETE FROM $cartTable WHERE $colid = $id');
    return result;
  }

  //COUNT OF CART ITEMS

  Future<int> getCount() async{
    Database  db = await this.database;
    List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $cartTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<CartObj>> getCartItems() async {
    var cartitemlist = await getCartMapList();
    int count = cartitemlist.length;

    List<CartObj> cartitems = List<CartObj>();
    for (int i = 0; i < count; i++) {
      cartitems.add(CartObj.fetch(cartitemlist[i]));
    }
    return cartitems;
  }
}