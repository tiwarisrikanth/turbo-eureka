import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes/pages/favPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
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
            Card(
              elevation: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                onPressed: () {},
                icon: Icon(
                  Icons.format_quote_rounded,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
            // Icon(
            //   Icons.circle_outlined,
            // ),
            // SizedBox(
            //   width: 120,
            // ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => FavPage(),
            //         ),
            //         (route) => false);
            //   },
            //   icon: Icon(Icons.favorite),
            // )
          ],
        ),
      ),
    );
  }
}
