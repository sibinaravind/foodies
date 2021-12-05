// import '../posts/BlogCard.dart';
// import "package:flutter/material.dart";
// import '../networkHandler.Dart';
// import './BlogCard.dart';

// class SuperBlog extends StatefulWidget {
//   SuperBlog({Key key, this.url}) : super(key: key);
//   final String url;

//   @override
//   _SuperBlogState createState() => _SuperBlogState();
// }

// class _SuperBlogState extends State<SuperBlog> {
//   NetworkHandler networkHandler = NetworkHandler();
//   List data;
//   bool len = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void fetchData() async {
//     var response = await networkHandler
//         .get(widget.url); // widget.url is used to access data through given url
//     data = response.map<dynamic>((m) => m['imgName'] as String).toList();
//     setState(() {
//       if (data.length > 0) {
//         len = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return len
//         ? Column(
//             children: data
//                 .map((item) => BlogCard(
//                       imgName: item,
//                       networkHandler: networkHandler,
//                     ))
//                 .toList(),
//           )
//         : Center(
//             child: Text("Not Have any Posts"),
//           );
//   } //data.map is used to map the values in the data table as newsfeed
// }

// class Blog {}
