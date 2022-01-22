import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotes/models/quotesModel.dart';
import 'package:quotes/pages/mainData.dart';
import 'package:quotes/repositories/mainQuotes.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/widgets/bottomNav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<FakeData>> showReceipts() async {
    // SharedPreferences sharedToken = await SharedPreferences.getInstance();
    // String token = sharedToken.getString("token");

    var apiUrl = await http.get(
        /*"http://46.101.47.11:3017/api/user/home"*/ Uri.parse(
            "https://type.fit/api/quotes/"));
    // headers: {"token": token});

    var jsonData = json.decode(apiUrl.body);

    List<FakeData> model = [];

    for (var u in jsonData) {
      FakeData receipts = FakeData(u["text"], u["author"]);

      model.add(receipts);
    }
    return model;
  }

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
              color: Colors.transparent,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black38,
              //     blurRadius: 20.0,
              //     offset: Offset.fromDirection(10.0, -8.0),
              //     spreadRadius: 2,
              //   ),
              // ],
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
          MainData(),
          BottomNavBar()
        ],
      ),
    );
    // body:
    // );
  }
}

class FakeData {
  final String text;
  final String author;

  FakeData(this.text, this.author);
}

// Column(
//         children: [
//           // Container(
//           //   height: 70,
//           //   color: Colors.amber,
//           // ),
//           Container(
//             // margin: EdgeInsets.only(top: 70),
//             height: MediaQuery.of(context).size.height,
//             child: FutureBuilder(
//               future: showReceipts(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (!snapshot.hasData)
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: LinearProgressIndicator(
//                         minHeight: 4.0,
//                         backgroundColor: Colors.orange.shade100,
//                         valueColor: new AlwaysStoppedAnimation<Color>(
//                             Colors.orange.shade400),
//                       ),
//                     ),
//                   );
//                 if (snapshot.data == null) {
//                   return Container(
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.orange,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         child: Card(
//                           elevation: 3.0,
//                           child: Padding(
//                             padding: const EdgeInsets.all(18.0),
//                             child: Text(
//                               snapshot.data[index].text.toString(),
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                         ),
//                         /*decoration: new BoxDecoration(
//                               border: new Border(
//                                   bottom: new BorderSide(color: Colors.grey)))*/
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//           Container(
//             height: 70,
//             color: Colors.amber,
//           ),
//         ],
//       ),
