import 'package:flutter/material.dart';
import 'package:connection_verify/connection_verify.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connection Verify Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(title: 'Connection Verify Example'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  final String title;

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  String _statusConnection = 'Unknown';

  void _setStatusConnection(String status) {
    setState(() {
      _statusConnection = status;
    });
  }

  void _verifyStatusConnection() async {
    // The network connection verification occurs every time this function is called.
    // It must occur inside an 'async' function, because this verification depends on the 'await' of the result
    // of the 'ping' test in 'google.com' site.

    // VERIFY THE NETWORK CONNECTION:
    if (await ConnectionVerify.connectionStatus()) {
      _setStatusConnection("Connected");
      // Every time the ConnectionVerify.connectionStatus() returns 'true', there is network connection available.
      // Do your online stuff here
    } else {
      _setStatusConnection("No connection");
      // So, when the verification returns false, you are Offline, so offline treatments must be done here.
      // Do your offline stuff here
    }
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
          children: [
            Text(
              'Last connection status: $_statusConnection',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _verifyStatusConnection,
              child: const Text("Verify Status Connection"),
            ),
          ],
        ),
      ),
    );
  }
}
