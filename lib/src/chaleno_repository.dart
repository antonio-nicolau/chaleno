import 'dart:async';
import 'package:chaleno/src/chaleno_parser.dart';
import 'package:http/http.dart' as http;

class Chaleno {
  Future<Parser?> load(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 404)
        return throw Exception("page not found exception");
      if (response.statusCode == 200) {
        return Parser(response.body);
      } else
        return throw Exception("No result found");
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
