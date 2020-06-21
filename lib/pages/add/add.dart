import 'package:flutter/material.dart';
import 'package:papalife/pages/add/booking/booking.dart';
import 'package:papalife/pages/add/todo/todo.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);
  _Add createState() => _Add();
}

class _Add extends State<Add> {
  var pages = <Widget>[
    TodoPage(),
    BookingPage(),
  ];
  int _selectedIndex = 0;
  _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var _pageController = new PageController(initialPage: 0);
  _onItemTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return pages.elementAt(_selectedIndex);
        },
        onPageChanged: _pageChange,
        controller: _pageController,
        itemCount: pages.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('记账'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('待做'),
          ),
        ],
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
