import 'package:flutter/material.dart';
import 'package:udp/udp.dart';
import './screens/custom_paint_path.dart';
import './screens/home.dart';
import './services/JsonParseDemo.dart';
import './services/udp_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'U D P',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          body: JasonParseDemo(), //Home(),
        ),
      ),
    );
  }
}

class UdpInitWidget extends StatefulWidget {
  @override
  _UdpInitWidgetState createState() => _UdpInitWidgetState();
}

class _UdpInitWidgetState extends State<UdpInitWidget> {
  final sender = UdpHelper.init();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<UDP>(
        future: sender,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              snapshot.hasError
                  ? Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            // "Unable to connect",
                            "${snapshot.error}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 0,
                      child: Container(
                        height: 10,
                        color: Colors.green,
                      ),
                    ),
              Expanded(
                flex: 5,
                child: Home(
                  sender: snapshot.data,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
