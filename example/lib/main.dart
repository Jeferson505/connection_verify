import 'package:flutter/material.dart';
import 'package:connection_verify/connection_verify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() async {
    // The network connection verification occurs every time this function is called.
    // It must occur inside an 'async' function, because this verification depends on the 'await' of the result
    // of the 'ping' test in 'example.com' site.

    // VERIFY THE NETWORK CONNECTION:
    if (await ConnectionVerify.connectionStatus()){
      print("I have network connection!");
      // Every time the ConnectionVerify.connectionStatus() returns 'true', there is network connection available.
      // Do your online stuff here
    } else {
      print("I don't have network connection!");
      // So, when the verification returns false, you are Offline, so offline treatments must be done here.
      // Do your offline stuff here
    }
    setState(() {
      _counter++;
    });
  }

  // The default 'counter app' build view
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
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
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
