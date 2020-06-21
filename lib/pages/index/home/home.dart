import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

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
  List<Map> todoList = [
    {'name': '阅读', 'id': '123', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写1代码', 'id': '312131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false},
    {'name': '写代码', 'id': '32131231', 'time': 0, 'isTimer': false}
  ];
  void startTimer(index) {
    const oneSec = const Duration(microseconds: 5);
    setState(() {
      todoList[index]['isTimer'] = true;
      todoList[index]['timer'] = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            print(timer);
            todoList[index]['time'] = todoList[index]['time'] + 1;
          },
        ),
      );
    });
  }

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
                /**
                 * 日程
                 */
                new Card(
                  elevation: 0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(14.0))), //设置圆角
                  child: new Column(
                    // card只能有一个widget，但这个widget内容可以包含其他的widget
                    children: [
                      new ListTile(
                        title: new Text('日程',
                            style: new TextStyle(fontWeight: FontWeight.w500)),
                        leading: new Icon(
                          Icons.restaurant_menu,
                          color: Colors.blue[500],
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                      new Divider(),
                      new Dismissible(
                        key: Key('1'),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.delete),
                        ),
                        secondaryBackground: Container(
                          color: Colors.blue,
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: new ListTile(
                          title: new Text('内容二'),
                          leading: new Icon(
                            Icons.contact_mail,
                            color: Colors.blue[500],
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          print(direction);
                          return false;
                        },
                      )
                    ],
                  ),
                ),

                /**
                 * 待做
                 */
                new Card(
                    elevation: 0, //设置阴影
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(14.0))), //设置圆角
                    child: new Column(
                      children: <Widget>[
                        new ListTile(
                          title: new Text('待做',
                              style:
                                  new TextStyle(fontWeight: FontWeight.w500)),
                          leading: new Icon(
                            Icons.restaurant_menu,
                            color: Colors.blue[500],
                          ),
                          trailing: Icon(Icons.more_vert),
                        ),
                        new Divider(),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: todoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                key: Key(todoList[index]['id']),
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.delete),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.blue,
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                child: new ListTile(
                                  title: new Text(todoList[index]['name']),
                                  subtitle: Text(new DateFormat('HH:mm:ss:SSS')
                                      .format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              todoList[index]['time']))),
                                  leading: new Icon(
                                    Icons.contact_mail,
                                    color: Colors.blue[500],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Visibility(
                                        child: IconButton(
                                          icon: Icon(Icons.play_arrow),
                                          onPressed: () {
                                            print('strat');
                                            startTimer(index);
                                          },
                                        ),
                                      ),
                                      Visibility(
                                        visible: todoList[index]['isTimer'],
                                        child: IconButton(
                                          icon: Icon(Icons.pause),
                                          onPressed: () {
                                            print('end');
                                            todoList[index]['timer'].cancel();
                                            todoList[index]['isTimer'] = false;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    print(todoList[index]['id']);
                                  },
                                ),
                                confirmDismiss: (direction) async {
                                  print(direction);
                                  return false;
                                },
                              );
                            }),
                      ],
                    )),

                /**
                 * 记账
                 */
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
