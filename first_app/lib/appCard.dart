import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  
  AppCard({Key key, @required this.child}) : super(key: key);

  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: widget.child,
    );
  }
}

