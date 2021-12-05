import 'dart:async';

import "package:flutter/material.dart";
import 'posts/Blogs.dart';
import 'posts/superBlog.dart';
import 'networkHandler.Dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkHandler networkhandler = NetworkHandler();
  String titleColor = '#aa3a3a'.replaceAll('#', '0xff');
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _handleRefresh() {
    // SuperBlog(
    //   url: "/getSuperImages",
    // );
    // Blogs(url: "/newsFeed");
    final Completer<void> completer = Completer<void>();

    setState(() {});
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
          child: ListView(children: <Widget>[
        Container(
          child: Image.asset("assets/50off.jpg", fit: BoxFit.fill),
          height: 150,
          width: MediaQuery.of(context).size.width / .5,
        ),
        Container(
          child: Image.asset("assets/dominos.jpg", fit: BoxFit.fill),
          height: 150,
          width: MediaQuery.of(context).size.width / .5,
        )
      ])),
    );
  }
}
