# Chaleno
A flutter package for webscraping data from websites.

This package contains a set of high-level functions that make it easy to webscrap websites. It's multi-platform, supports mobile, desktop, and the web.

# Usage
Scraping data from websites, this package gives you the power to scrape the web in an easy way.
#### Instance Chaleno class
```Dart
var parser = await Chaleno().load('https://example.com');
```
It returns a Parser which we can use to start webscraping.

You can load HTML file from localhost.
```Dart
var parser = await Chaleno().load('https://localhost/index');

var parser = await Chaleno().load('https://192.168.1.122/index');
```

#### Very simple to use
After instantiating Chaleno class, you can easily retrieve any data using few code lines
```Dart 
Result result = parser.getElementById('id');
print(result.text);

List<Result> results = parser.getElementsByClassName('className');
results.map((item) => print(item.text))
```
You can return a single result or a list of results and map them. You can find most popular methods and attributes in table below.

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

