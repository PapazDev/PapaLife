import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Card(
                  elevation: 0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(14.0))), //设置圆角
                  child: new Column(
                    // card只能有一个widget，但这个widget内容可以包含其他的widget
                    children: [
                      new ListTile(
                        title: new Text('待做',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        leading: new Icon(
                          Icons.restaurant_menu,
                          color: Colors.blue[500],
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text('内容一',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        leading: new Icon(
                          Icons.contact_phone,
                          color: Colors.blue[500],
                        ),
                        trailing: Icon(Icons.check_circle_outline),
                      ),
                      new Dismissible(
                        key: UniqueKey(),
                        background: new Container(color: Colors.red,),
                        child: new ListTile(
                          title: new Text('内容二'),
                          leading: new Icon(
                            Icons.contact_mail,
                            color: Colors.blue[500],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                new Card(
                  elevation: 0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(14.0))), //设置圆角
                  child: new Column(
                    // card只能有一个widget，但这个widget内容可以包含其他的widget
                    children: [
                      new ListTile(
                        title: new Text('打卡',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        leading: new Icon(
                          Icons.restaurant_menu,
                          color: Colors.blue[500],
                        ),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text('内容一',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        leading: new Icon(
                          Icons.contact_phone,
                          color: Colors.blue[500],
                        ),
                      ),
                      new ListTile(
                        title: new Text('内容二'),
                        leading: new Icon(
                          Icons.contact_mail,
                          color: Colors.blue[500],
                        ),
                      ),
                    ],
                  ),
                ),
                new Card(
                  elevation: 0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(14.0))), //设置圆角
                  child: new Column(
                    // card只能有一个widget，但这个widget内容可以包含其他的widget
                    children: [
                      new ListTile(
                        title: new Text('今日预算',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: new Text('￥1000,000,000'),
                        leading: new Icon(
                          Icons.attach_money,
                          color: Colors.blue[500],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
