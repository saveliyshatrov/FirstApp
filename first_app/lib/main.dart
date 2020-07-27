import 'dart:ui';

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

//rgb(234,76,137)
Widget applicationBar(String text) {
  return AppBar(
    brightness: Brightness.light,
    title: Text(
      text,
      style: TextStyle(color: Color.fromRGBO(234,76,137, 1)),
    ),
    backgroundColor: Color.fromRGBO(255,255,255, 0.8),
    elevation: 0.0,
    flexibleSpace: Container(
      child: ClipRRect( // make sure we apply clip it properly
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
        ),
      ),
    ),
  );
}
//https://retail-loyalty.org/upload/iblock/fa1/7bf357334417f3f9649b96b6a0e66eee.jpg
Widget createElemForCarousel(
    String name, Color backgroundColor, Color fontColor) {
  return Builder(
    builder: (BuildContext context) {
      return new InkWell(
          onTap: () {
            debugPrint("$name");
          },
          child: Container(
              alignment: Alignment(.0, .0),
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
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
              child: Align(
                alignment: Alignment(0.8, 0.8),
                child: Text(
                '$name',
                style: TextStyle(fontSize: 20.0, color: fontColor),
              ))));
    },
  );
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationBar("StuDuck"),
      extendBodyBehindAppBar: true,
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
