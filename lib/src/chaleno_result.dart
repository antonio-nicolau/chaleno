import 'package:html/dom.dart';
import 'package:html/parser.dart';

class Result {
  Element? _result;
  DocumentFragment? _dom;

  Result(result) {
    this._result = result;
    this._dom = parseFragment(result.outerHtml);
  }

  String? get html => _result?.outerHtml;

  String? get text => _result?.text;

  String? get innerHTML => _result?.innerHtml;

  String? get id => _result?.id;

  String? get classe => _result?.className;

  String? get src => _getAtribut("src");

  String? get href => _getAtribut("href");

  String? get alt => _getAtribut("alt");

  String? get width => _getAtribut("width");

  String? get height => _getAtribut("height");

  String? get title => _getAtribut("title");

  String? get action => _getAtribut("action");

  String? get hidden => _getAtribut("hidden");

  //Return Element's atribut according [attr] param
  String? _getAtribut(String? attr) {
    String? res = _result?.outerHtml != null ? _result?.outerHtml : null;
    RegExp regex = RegExp("^.*$attr=\"(.*?)\"");
    String? regexResult = regex.firstMatch(res.toString())?.group(1);
    return regexResult;
  }

  Result? querySelector(selector) {
    Element? result = _dom?.querySelector(selector);
    return Result(result);
  }

  List<Result>? querySelectorAll(selector) {
    List<Element>? results = _dom?.querySelectorAll(selector);
    return _extractResults(results);
  }

  //Organize results into a list of result
  List<Result>? _extractResults(List<Element>? data) {
    List<Result>? results = <Result>[];

    data?.forEach((item) {
      Result result = Result(item);
      results.add(result);
    });
    return results;
  }
}
