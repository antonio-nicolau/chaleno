import 'package:chaleno/src/chaleno_result.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class Parser {
  Document? _dom;

  Parser(String? dom) {
    _dom = parse(dom);
  }

  Result? get parent => Result(_dom?.parent);

  String? get html => _dom?.outerHtml;

  List<Element>? get children => _dom?.children;

  Result getElementById(id) {
    return Result(_dom?.getElementById(id));
  }

  List<Result>? getElementsByTagName(String? tag) {
    final results = _dom?.getElementsByTagName(tag.toString());
    return _extractResults(results);
  }

  List<Result> getElementsByClassName(classe) {
    final results = _dom?.getElementsByClassName(classe);
    return _extractResults(results);
  }

  Result querySelector(selector) {
    final result = _dom?.querySelector(selector);
    return Result(result);
  }

  List<Result> querySelectorAll(selector) {
    final results = _dom?.querySelectorAll(selector);
    return _extractResults(results);
  }

  //Organize results into a list of result
  List<Result> _extractResults(List<Element>? data) {
    List<Result>? results = <Result>[];

    data?.forEach((item) {
      final result = Result(item);
      results.add(result);
    });
    return results;
  }

  //Return page tite
  String? title() {
    var document = _dom?.outerHtml;
    final regex = RegExp('<title>(.*?)<\/title>');
    final response = regex.firstMatch(document.toString());
    return response != null ? response.group(1) : null;
  }
}
