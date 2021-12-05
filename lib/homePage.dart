import "package:flutter/material.dart";
import 'homeScreen.dart';
import 'networkHandler.Dart';
import 'MenuScreen.dart';
import 'cart.dart';
// import 'model/itemModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.stat}) : super(key: key);
  final int stat;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bgColor = '#f6f5f5'.replaceAll('#', '0xff');
  String titleColor = '#aa3a3a'.replaceAll('#', '0xff');
  String textColor = '#f6f5f5'.replaceAll('#', '0xff');
  NetworkHandler networkhandler = NetworkHandler();
  Widget page = CircularProgressIndicator();
  // ItemModel itemmodel = ItemModel();
  String username = "";
  int currentState;
  List<Widget> widgets = [MenuScreen(), FoodCart(), HomeScreen()];
  @override
  void initState() {
    currentState = widget.stat;
    print("hellooooooooooooooooo" + currentState.toString());
    setState(() {
      currentState = widget.stat;
    });
    // displayWidget = mainWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Color(int.parse(titleColor)), opacity: 30, size: 40),
        backgroundColor: Color(int.parse(bgColor)),
        // flexibleSpace: Image.asset("assets/pilasaLogo2.png"),
        title: Text("Foodies",
            style: TextStyle(
                color: Color(int.parse(titleColor)),
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(int.parse(titleColor)),
        onPressed: () {
          setState(() {
            currentState = 2;
          });
        },
        child: Icon(
          Icons.home,
          size: 25,
          color: currentState == 2 ? Colors.white : Colors.white54,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(int.parse(titleColor)),
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Container(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.restaurant),
                      color: currentState == 0 ? Colors.white : Colors.white54,
                      onPressed: () {
                        setState(() {
                          currentState = 0;
                        });
                      },
                      iconSize: 30),
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  IconButton(
                      // icon: Icon(Church.church),
                      icon: Icon(Icons.shopping_bag),
                      onPressed: () {
                        setState(() {
                          currentState = 1;
                        });
                      },
                      color: currentState == 1 ? Colors.white : Colors.white54,
                      iconSize: 30)
                ],
              ),
            ),
          )),
      body: widgets[currentState],
    );
  }
}
