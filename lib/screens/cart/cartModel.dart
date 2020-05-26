class CartObj{
  int _id;
  String _name;
  double _price;
  String _image;
  int _quantity;
  String _representation;
  CartObj(this._id,this._image,this._name,this._price,this._quantity,this._representation);

  int get id => _id;
  String get name => _name;
  double get price => _price;
  String get image => _image;
  int get quantity =>  _quantity;
  String get representation => _representation; 

  set id(int newID){
    this._id = newID;
  }
  set name(String newName){
    this._name = newName;
  }
  set price(double newPrice){
    this._price = newPrice;
  }
  set image(String newImage){
    this._image = newImage;
  }
  set quantity(int newQuantity){
    if (newQuantity > 0) {
      this._quantity = newQuantity;
    }
  }
  set representation(String newRep){
    this._representation = newRep;
  }

  Map toJson() => {
        'product': _id,
        'quantity': _quantity,
      };

  Map<String,dynamic> toMap(){
    var map =  Map<String,dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['quantity'] = _quantity;
    map['representation'] = _representation;
    return map;
  }

  CartObj.fetch(Map<String, dynamic> map){
    this._id = map['id'];
    this._name= map['name'];
    this._price= map['price'];
    this._image= map['image'];
    this._quantity= map['quantity'];
    this._representation = map['representation'];

  }
}