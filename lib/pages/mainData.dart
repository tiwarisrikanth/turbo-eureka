import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class MainData extends StatefulWidget {
  const MainData({Key key}) : super(key: key);

  @override
  _MainDataState createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  SharedPreferences _preferences;
  final translator = GoogleTranslator();
  bool fav = false;

  String changedStr = '';

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
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      // color: Colors.amber,
      child: FutureBuilder(
        future: showReceipts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: LinearProgressIndicator(
                  minHeight: 4.0,
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                ),
              ),
            );
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var translatedText = translator
                    .translate(snapshot.data[index].text, from: 'en', to: 'hi')
                    .toString();
                var a = snapshot.data[index].text.toString();
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, right: 10.0, left: 10.0, bottom: 2.0),
                    child: Card(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                a.toString(),
                                // snapshot.data[index].text.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: snapshot.data[index].author == null
                                    ? Text(
                                        "-- Anonymous",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        // textAlign: TextAlign.start,
                                      )
                                    : Text(
                                        "-- " +
                                            snapshot.data[index].author
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        // textAlign: TextAlign.start,
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // IconButton(
                                //   color: Colors.blue[900],
                                //   onPressed: () async {
                                //     SharedPreferences _sharedLanguage =
                                //         await SharedPreferences.getInstance();

                                //     _sharedLanguage.clear();

                                //     print(changedStr);

                                //     var a = await translator.translate(
                                //         snapshot.data[index].text,
                                //         from: 'en',
                                //         to: 'hi');

                                //     // setState(() {
                                //     //   changedStr = a.toString();
                                //     // });

                                //     _sharedLanguage.setString(
                                //         "language", a.toString());
                                //   },
                                //   icon: Icon(
                                //     Icons.translate_sharp,
                                //   ),
                                // ),
                                // Spacer(),
                                Card(
                                  elevation: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: IconButton(
                                    onPressed: () {
                                      Share.share(
                                        snapshot.data[index].text +
                                            "\n" +
                                            "-- " +
                                            snapshot.data[index].author,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                // IconButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       fav = !fav;
                                //     });
                                //   },
                                //   icon: fav == true
                                //       ? Icon(Icons.favorite)
                                //       : Icon(Icons.favorite_border),
                                // )
                                // Icon(Icons.)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*decoration: new BoxDecoration(
                              border: new Border(
                                  bottom: new BorderSide(color: Colors.grey)))*/
                );
              },
            );
          }
        },
      ),
    );
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
