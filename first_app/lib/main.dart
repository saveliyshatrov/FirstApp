import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageOne(),
    );
  }
}

Widget createElemForCarousel(
    String name, Color backgroundColor, Color fontColor) {
  return Builder(
    builder: (BuildContext context) {
      return new InkWell(
          onTap: () {
            debugPrint("$name");
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                '$name',
                style: TextStyle(fontSize: 30.0, color: fontColor),
              ))));
    },
  );
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        title: Text(
          'Студак',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ), //, bottom: 8),
        child: ListView(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                createElemForCarousel(
                    "Кафе и Рестораны", Colors.red, Colors.white),
                createElemForCarousel("Антикафе", Colors.orange, Colors.white),
                createElemForCarousel("Бары", Colors.green, Colors.white),
                createElemForCarousel("Еще что-то", Colors.blue, Colors.white),
              ],
            ),
            /*Text("Новинки",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
              ),
            ),*/
            Container(
              child: ListTile(
                  onTap: () {
                    debugPrint("I was clicked");
                  },
                  leading: Icon(
                    Icons.local_bar,
                    size: 56,
                  ),
                  title: Text('Two-line ListTile'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.fastfood)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Favourite",
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => PageTwo()),
            );
          }),
    );
  }
}

// page two
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page #2'),
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      ),
      body: Container(
        child: Center(
            child: new CupertinoButton(
          child: Text("Page #3"),
          color: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => PageThree()),
            );
          },
        )),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page #3'),
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      ),
      /*child: Container(
        child: Center(
            child: new CupertinoButton(
          child: Text("Page #3"),
          color: Colors.orange,
          onPressed: () {
            
          },
        )),
      ),*/
    );
  }
}
