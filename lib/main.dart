import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CupertinoRoute.dart';
import 'NewRoute.dart';
import 'TipRoute.dart';
import 'Styles.dart';


//main 之前可以自定义异常捕获
void main() => runApp(MyApp());

String text = "我是参数";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page',),
        "new_page" : (context) => NewRoute(),
        "tip_page" : (context) => TipRoute(),
        "cupertino_page" : (context) => CupertinoRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Styles().style1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page",);
              },
            ),
            RaisedButton(
              child: Text("取得返回值"),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.of(context).pushNamed("tip_page",arguments: text);
                print("$result");
              },
            ),
            RaisedButton(
              child: Text("打开cupertino界面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("cupertino_page");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
