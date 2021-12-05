import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';

import 'homePage.dart';
import "package:flutter/material.dart";

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name;
  String price;
  String titleColor = '#aa3a3a'.replaceAll('#', '0xff');
  String bgColor = '#f6f5f5'.replaceAll('#', '0xff');
  List<dynamic> listdata = [];
  // listdata[0].name = 'samoosa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Samoosa',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left),
                                ),
                                Container(
                                  child: Image.asset("assets/burger.jpg",
                                      fit: BoxFit.cover),
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(

                                  //       fit: BoxFit.fitWidth),
                                  //   borderRadius: BorderRadius.only(
                                  //       bottomLeft: Radius.circular(80),
                                  //       bottomRight: Radius.circular(80)),
                                  //   color: Colors.white,
                                  // ),
                                  height: 150,
                                  width: MediaQuery.of(context).size.width / .5,
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Rs. 12',
                                              style: TextStyle(
                                                  color: Color(
                                                      int.parse(titleColor)),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left),
                                          FlatButton(
                                            color: Color(int.parse(titleColor)),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  backgroundColor: Colors.grey,
                                                  content: RichText(
                                                      text: TextSpan(
                                                    text:
                                                        'Item Added to the cart',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: '   View Cart',
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              HomePage(stat: 1)));
                                                                },
                                                          style: TextStyle(
                                                            color: Color(
                                                                int.parse(
                                                                    titleColor)),
                                                          )),
                                                    ],
                                                  )),
                                                ),
                                              );
                                            },
                                          ),
                                        ]))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))),
    );
  }
}
