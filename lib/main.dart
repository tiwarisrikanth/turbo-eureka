import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/pages/homePage.dart';
import 'package:quotes/pages/test.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.primaries[
        Random().nextInt(Colors.primaries.length)], // navigation bar color
    statusBarColor: Colors.primaries[
        Random().nextInt(Colors.primaries.length)], // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      home: TestScreen(),
    );
  }
}
