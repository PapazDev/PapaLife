import 'package:flutter/material.dart';
import 'package:papalife/pages/index/index.dart';
import 'package:papalife/pages/calender/calender.dart';
import 'package:papalife/menu.dart';

/* 
 * 底部Tab栏
 * 相当于主页面面了
 */

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pagesList = [
    {"title": '首页', "page": MyHomePage()},
    {"title": '日历', "page": MyCalenderPage()},
  ];
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(this._pagesList[this._currentIndex]['title'],
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
            color: Colors.black,
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () => _scaffoldkey.currentState.openDrawer(),
        ),
      ),
      body: this._pagesList[this._currentIndex]["page"],
      drawer: Menu.homeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (index) {
            this.setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('日历')),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
