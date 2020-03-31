import 'package:flutter/material.dart';

class Menu {
  static Widget homeDrawer() {
    return new Container(
      color: Colors.white,
      child: new ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          _drawerHeader(),
          new ClipRect(
            child: new ListTile(
              leading: new CircleAvatar(child: new Text("A")),
              title: new Text('Drawer item A'),
              onTap: () => {},
            ),
          ),
          new ListTile(
            title: new Text('设置',style: new TextStyle(fontSize:18),),
            onTap: (){
              print('设置');
              },
          ),
        ],
      ),
    );
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
        accountName: new Text(
          "admin",
        ),
        accountEmail: new Text(
          "admin@papaz.me",
        ),
        currentAccountPicture: new CircleAvatar(
        ),
        onDetailsPressed: () {},
        otherAccountsPictures: <Widget>[
          new CircleAvatar(
          ),
        ],
        decoration: BoxDecoration(color: Colors.orange));
  }
}
