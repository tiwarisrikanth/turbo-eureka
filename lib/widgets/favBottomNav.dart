import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes/pages/homePage.dart';

class FavBottomBar extends StatefulWidget {
  const FavBottomBar({Key key}) : super(key: key);

  @override
  _FavBottomBarState createState() => _FavBottomBarState();
}

class _FavBottomBarState extends State<FavBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20.0,
            offset: Offset.fromDirection(-1.0, 8.0),
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              icon: Icon(Icons.format_quote_rounded),
            ),
            SizedBox(
              width: 120,
            ),
            Card(
              elevation: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
            // Icon(
            //   Icons.circle_outlined,
            // ),
          ],
        ),
      ),
    );
  }
}
