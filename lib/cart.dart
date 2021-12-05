import 'dart:convert';
import 'package:flutter/material.dart';
import 'NetworkHandler.Dart';

class FoodCart extends StatefulWidget {
  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {
  String titleColor = '#aa3a3a'.replaceAll('#', '0xff');
  String bgColor = '#f6f5f5'.replaceAll('#', '0xff');
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _noteController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<dynamic> listdata = [];

  int amount = 12;
  int count = 1;
  bool firstClick = true;
  bool cancelFc = true;
  bool circular = false;
  bool favStatus = true;
  String status = "loading....";
  String phone = "loading....";
  String time = "loading... ";
  String churchId;
  String bookingId;
  @override
  void initState() {
    super.initState();
    fetchChurches();
  }

  void fetchChurches() async {
    var response = await networkHandler.get("/viewBooking");
    // print(response);
    setState(() {
      listdata = response["cart"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(int.parse(bgColor)),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(" Order Summary",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(int.parse(titleColor)),
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
              noteTextField(),
              SizedBox(
                height: 4,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Samoosa',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left),
                              Row(children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    if (count != 1)
                                      setState(() {
                                        count = count - 1;
                                      });
                                  },
                                  child: Text('-'),
                                ),
                                Text(count.toString(),
                                    style: TextStyle(
                                        color: Colors.red[400], fontSize: 16)),
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      count = count + 1;
                                    });
                                  },
                                  child:
                                      Text('+', style: TextStyle(fontSize: 16)),
                                ),
                              ])
                            ]),
                        Text('Rs  ' + (amount).toString(),
                            style: TextStyle(
                                color: Color(int.parse(titleColor)),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                      ])),
              SizedBox(
                height: 2,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(' Grand Total',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.right),
                        Text('RS ' + (amount * count).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right),
                      ])),
              Divider(
                thickness: 4,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Address',
                                  style: TextStyle(
                                    color: Colors.pink[200],
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.left),
                              Text('Aikara House \nVellarikundu Po \nkerala',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.left),
                            ]),
                        Text('Change',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.right),
                      ])),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: circular
                            ? CircularProgressIndicator()
                            : Text("Proceed",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ));
  }

  Widget noteTextField() {
    return TextFormField(
      controller: _noteController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color((int.parse(titleColor))),
            width: 2,
          ),
        ),
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        labelText: "Note eg: add Some sauce",
      ),
    );
  }
}
