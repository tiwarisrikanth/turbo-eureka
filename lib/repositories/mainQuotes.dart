import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes/models/quotesModel.dart';
import 'package:http/http.dart' as http;

Future<List<Quotes>> quoterRepo() async {
  // SharedPreferences sharedToken = await SharedPreferences.getInstance();
  // String token = sharedToken.getString("token");

  final response = await http.get(Uri.parse("https://type.fit/api/quotes/"));

  try {
    if (response.statusCode == 200) {
      return json.decode(response.body).toList();
    } else if (response.statusCode == 400) {
      Fluttertoast.showToast(msg: response.body);
    } else if (response.statusCode == 412) {
      Fluttertoast.showToast(msg: response.body);
    } else if (response.statusCode == 500) {
      Fluttertoast.showToast(msg: response.body);
    }
  } catch (e) {
    print(e);
  }
  throw Exception("Error on server");
}
