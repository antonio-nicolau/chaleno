import 'dart:async';
import 'package:chaleno/src/chaleno_parser.dart';
import 'package:http/http.dart' as http;

class Chaleno {
  String? document;

  //Load and result content page from url given
  //Can Load from URL or Asset folder
  //To indicate to load from asset set [fromAsset] true
  Future<Parser?> load(String url) async {
    final httClient = http.Client();
    try {
      final uri = Uri.parse(url);

      final response = await httClient.get(uri);
      if (response.statusCode == 200) {
        document = response.body;
      }
    } catch (e) {
      print('Chaleno [ Exception ]: $e');
    } finally {
      httClient.close();
    }

    return Parser(document);
  }
}
