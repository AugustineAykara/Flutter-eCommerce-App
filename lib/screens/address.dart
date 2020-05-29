import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address extends StatefulWidget {
  final String useremail;
  Address({Key key, this.useremail}) : super(key: key);
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String addressLine1, addressLine2, city, state, country, pin;

  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  saveAddress() {
    Firestore.instance
        .collection('users')
        .document(widget.useremail)
        .updateData({
      'addressLine1': address1Controller.text,
      'addressLine2': address2Controller.text,
      'city': cityController.text,
      'state': stateController.text,
      'country': countryController.text,
      'pin': pinController.text,
    });
  }

  getAddress() {
    Firestore.instance
        .collection('users')
        .document(widget.useremail)
        .get()
        .then((value) {
      setState(() {
        addressLine1 = value.data['addressLine1'].toString();
        addressLine2 = value.data['addressLine2'].toString();
        city = value.data['city'];
        state = value.data['state'];
        country = value.data['country'];
        pin = value.data['pin'].toString();
      });
      address1Controller = TextEditingController(text: addressLine1);
      address2Controller = TextEditingController(text: addressLine2);
      cityController = TextEditingController(text: city);
      stateController = TextEditingController(text: state);
      countryController = TextEditingController(text: country);
      pinController = TextEditingController(text: pin);
    });
  
  }

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "My Address",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.15,
                          height: MediaQuery.of(context).size.height / 1.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.8),
                                blurRadius: 8,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              addressTextField(
                                  "Address Line 1",
                                  address1Controller,
                                  TextInputType.text,
                                  Icons.home),
                              addressTextField(
                                  "Address Line 2",
                                  address2Controller,
                                  TextInputType.text,
                                  Icons.home),
                              addressTextField("City", cityController,
                                  TextInputType.text, Icons.location_city),
                              addressTextField("State", stateController,
                                  TextInputType.text, Icons.public),
                              addressTextField("Country", countryController,
                                  TextInputType.text, Icons.public),
                              addressTextField("PIN", pinController,
                                  TextInputType.number, Icons.fiber_pin),
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  color: Colors.black,
                                  splashColor: Colors.lightBlue,
                                  onPressed: () {
                                    saveAddress();
                                    alertBox("Address successfully updated");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addressTextField(msg, controller, format, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: format,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            labelText: msg,
            contentPadding: EdgeInsets.only(bottom: 12)),
      ),
    );
  }

  void alertBox(message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
