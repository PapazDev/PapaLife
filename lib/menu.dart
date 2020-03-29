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
            leading: new CircleAvatar(child: new Text("B")),
            title: new Text('Drawer item B'),
            subtitle: new Text("Drawer item B subtitle"),
            onTap: () => {},
          ),
          new AboutListTile(
            icon: new CircleAvatar(child: new Text("Ab")),
            child: new Text("About"),
            applicationName: "Test",
            applicationVersion: "1.0",
            applicationLegalese: "applicationLegalese",
            aboutBoxChildren: <Widget>[
              new Text("BoxChildren"),
              new Text("box child 2")
            ],
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
          backgroundImage: new AssetImage("images/"),
        ),
        onDetailsPressed: () {},
        otherAccountsPictures: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage("images/"),
          ),
        ],
        decoration: BoxDecoration(color: Colors.orange));
  }
}
