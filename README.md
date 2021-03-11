# Chaleno
A flutter package to webscraping data from websites

This package contains a set of high-level functions that make it easy to webscrap websites. It's multi-platform, and supports mobile, desktop, and the web.

# Get started
Webscraping any data from website, this package give you this power from the easely way
### Add dependency
```
dependencies:
  chaleno: 0.0.1
```

### Very simple to use
You can take any data using few code lines
```Dart 
var parser = await Chaleno().load("url");
Result result = parser.getElementById("id");
print(result.text);
```

## Example
```Dart 
var parser = await Chaleno().load("https://filipedeschamps.com.br/newsletter");

if (parser != null) {
    head = parser.getElementsByClassName("title")[0].text;
    subscribeCount = parser.querySelector(".subscribers-count-note").text;
    img = parser.querySelector(".jsx-1373700303 img").src;
}

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

