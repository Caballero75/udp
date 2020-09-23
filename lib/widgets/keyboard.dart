import 'package:flutter/material.dart';
import 'package:udp/udp.dart';

import '../models/notas.dart';
import '../widgets/keyboard_key.dart';

class Keyboard extends StatefulWidget {
  final UDP sender;
  const Keyboard({
    Key key,
    this.sender,
  }) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double keyWidth = width / 6; // ~Key(naturals) per screen
    double keyHeight = height / 5;
    double keyPadding = 7;

    return Stack(
      children: [
        for (int i = 0; i < mapaNotas.length; i++)
          KeyboardKey(
            index: i,
            keyWidth: keyWidth,
            keyHeight: keyHeight,
            keyPadding: keyPadding,
          )
      ],
    );
  }
}

// Expanded(
//                   child: GestureDetector(
//                     onTapDown: (_) =>
//                         UdpHelper.send(snapshot.data, 144, i, 127),
//                     onTapUp: (_) => UdpHelper.send(snapshot.data, 128, i, 127),
//                     child: Container(
//                       margin: EdgeInsets.all(8),
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                 ),
