# Chaleno
A flutter package to webscraping data from websites

This package contains a set of high-level functions that make it easy to webscrap websites. It's multi-platform, and supports mobile, desktop, and the web.

# Usage
Webscraping any data from website, this package give you this power from the easely way
#### Instance Chaleno classe
```Dart
var parser = await Chaleno().load('https://example.com');
```
It return a Parser witch one we will use to get any data

You can load HTML file from localhost
```Dart
var parser = await Chaleno().load('https://localhost/index');

var parser = await Chaleno().load('https://192.168.1.122/index');
```

#### Very simple to use
After intance Chaleno class, you can easily take any data using few code lines
```Dart 
Result result = parser.getElementById('id');
print(result.text);

List<Result> results = parser.getElementsByClassName('className');
results.map((item) => print(item.text))
```
You can return a single Result or a list of results and go map them. You can find most popular methods and attributs in table bellow

### Example
```Dart 
var parser = await Chaleno().load('https://filipedeschamps.com.br/newsletter');

header = parser.getElementsByClassName('title')[0].text;
subscribeCount = parser.querySelector('.subscribers-count-note').text;
image = parser.querySelector('.jsx-1373700303 img').src;

```
## Importants Methods and propriets
|Methods | Mean |
|-------- | ------|
| title | Return the page title |
| getElementById | Return a single element searching for ID on the page |
| getElementsByClassName | Return a list of elements according class passed as parameter |
| getElementsByTagName | Return a list of elements according tag passed as parameter |
| querySelector | Return single element passing a list of selector |
| querySelectorAll | Return a list of elements passing a list of selector |
| text | Return text atribute from a tag returned |
| src | Return src atribute from a tag returned |
| href | Return href atribute from a tag returned |

