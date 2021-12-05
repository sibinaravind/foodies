// import '../Model/addBlogModels.dart';
// // import '../Model/superModel.dart';
// import "package:flutter/material.dart";
// import '../networkHandler.Dart';

// class Blogs extends StatefulWidget {
//   Blogs({Key key, this.url}) : super(key: key);
//   final String url;
//   @override
//   _BlogsState createState() => _BlogsState();
// }

// class _BlogsState extends State<Blogs> {
//   String bgColor = '#f6f5f5'.replaceAll('#', '0xff');
//   String titleColor = '#aa3a3a'.replaceAll('#', '0xff');
//   String textColor = '#f6f5f5'.replaceAll('#', '0xff');
//   NetworkHandler networkHandler = NetworkHandler();
//   // SuperModel superModel = SuperModel();
//   List<AddBlogModel> data = [];
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
//     var response = await networkHandler.get(widget.url);
//     // superModel = SuperModel.fromJson(response);
//     setState(() {
//       // data = superModel.data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return data != null
//         ? Column(
//             children: data
//                 .map((item) => Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Column(children: <Widget>[
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         shadowColor: Colors.black,
//                         color: Colors.white,
//                         elevation: 10,
//                         child: Padding(
//                           padding: const EdgeInsets.all(3.0),
//                           child: Column(
//                             children: <Widget>[
//                               SizedBox(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text('${item.churchName}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                             textAlign: TextAlign.left),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                             '${item.created.day}/${item.created.month}/${item.created.year}',
//                                             style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                             textAlign: TextAlign.left),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: Color(int.parse(item.color)),
//                                     // color: Colors.deepOrange[200],
//                                     borderRadius: BorderRadius.circular(15)),
//                                 height: 180,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     item.content,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ]))
//                     )
//                 .toList(),
//           )
//         : Center(
//             child: Text("Not have any post.. "),
//           );
//   }
// }
