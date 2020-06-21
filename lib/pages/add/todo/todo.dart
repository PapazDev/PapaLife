import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TodoPage extends StatefulWidget{
  TodoPage({Key key}):super(key:key);
  _TodoState createState() => _TodoState();
}
class _TodoState extends State<TodoPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}