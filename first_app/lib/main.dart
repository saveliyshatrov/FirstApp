import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

// page one
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        title: Text(
          'Page #1',
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1)
          ),
          ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Color.fromRGBO(0, 0, 0, 1)]
          )
        ),
        padding: EdgeInsets.only(top:7),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              shadowColor: Colors.orange,
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  debugPrint("I was clicked");
                },
                leading: Icon(
                  Icons.accessibility,
                  size: 56,
                ),
                title: Text('Two-line ListTile'),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.desktop_mac)
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Next Page",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        icon: Icon(
          Icons.arrow_forward,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => PageTwo()),
          );
        }
      ),
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
