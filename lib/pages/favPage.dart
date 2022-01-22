import 'package:flutter/material.dart';
import 'package:quotes/widgets/favBottomNav.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20.0,
                  offset: Offset.fromDirection(10.0, -8.0),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_sharp),
                  ),
                  Spacer(),
                  Text(
                    "Quotes",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.public),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: Text(
              "Fav Page",
            ),
          ),
          Spacer(),
          FavBottomBar()
        ],
      ),
    );
  }
}
