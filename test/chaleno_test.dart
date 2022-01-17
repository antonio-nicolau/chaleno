import 'package:chaleno/chaleno.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Parser? parser;

  setUp(() async {
    parser = await Chaleno().load('https://github.com/antonio-nicolau');
  });

  group('Test Parser class', () {
    test('Extract data', () {
      expect(parser?.getElementsByClassName('repo').length, greaterThan(0));
    });
  });

  group('Test result class', () {
    test('Result - tag value empty', () {
      expect(parser?.querySelectorAll('.repo')[0].src, isNull);
    });

    test('Result - tag value not empty', () {
      expect(parser?.querySelectorAll('.repo')[0].text, isNotNull);
    });
  });

  group('Test to get any attr from element', () {
    test('Get ´data-scope-type´ attr value from ´js-site-search-form´ class element', () {
      expect(parser?.getElementsByClassName('js-site-search-form')[0].attr('data-scope-type'), equals('User'));
    });
  });
}
