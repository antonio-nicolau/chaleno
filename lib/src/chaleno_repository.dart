import 'dart:async';
import 'package:chaleno/src/chaleno_parser.dart';
import 'package:http/http.dart';

class Chaleno {
  Future<Parser?> load(String url) async {
    try {
      final response = await Client().get(Uri.parse(url));
      if (response.statusCode == 200) return Parser(response.body);
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
