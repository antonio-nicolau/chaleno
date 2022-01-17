import 'dart:async';
import 'package:chaleno/src/chaleno_parser.dart';
import 'package:http/http.dart';

class Chaleno {
  String? document;

  //Load and result content page from url given
  //Can Load from URL or Asset folder
  //To indicate to load from asset set [fromAsset] true
  Future<Parser?> load(String url) async {
    try {
      final response = await Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        document = response.body;
      }
    } catch (e) {
      print('Chaleno [ UrlException ] : $e');
    }

    return Parser(document);
  }
}
