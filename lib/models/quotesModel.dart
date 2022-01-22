class Quotes {
  final String text;
  final String author;

  Quotes({this.text, this.author});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      text: json["text"],
      author: json["author"],
    );
  }
}

// class PhotosList {
//   final List<Quotes> quo;

//   PhotosList({
//     this.quo,
//   });
//   factory PhotosList.fromJson(List<dynamic> parsedJson) {
//     List<Quotes> photos = new List<Quotes>();

//     photos = parsedJson.map((i) => Quotes.fromJson(i)).toList();
//     return new PhotosList(
//       quo: photos,
//     );
//   }
// }
