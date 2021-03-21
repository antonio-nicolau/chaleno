import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? header, subscribeCount, img;

  void scrapData() async {
    final url = 'https://filipedeschamps.com.br/newsletter';
    var response = await Chaleno().load(url);

    header = response?.getElementsByClassName('title')[0].text;
    subscribeCount = response?.querySelector('.subscribers-count-note').text;
    img = response?.querySelector('.jsx-1373700303 img').src;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scrapData();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(15, 60, 15, 20),
            child: header == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://filipedeschamps.com.br$img',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '$header',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        '$subscribeCount',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () => null,
                          child: Text(
                            'Inscrever-se',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
