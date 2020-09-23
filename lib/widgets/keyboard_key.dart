import 'package:flutter/material.dart';

import '../models/notas.dart';

class KeyboardKey extends StatelessWidget {
  final int index;
  final double keyWidth;
  final double keyHeight;
  final double keyPadding;
  KeyboardKey({
    Key key,
    this.index,
    this.keyWidth,
    this.keyHeight,
    this.keyPadding,
  }) : super(key: key);

  Widget build(BuildContext context) {
    // print(channel);
    int i = index;
    bool isSharp = mapaNotas[i]['noteName'].toString().contains('#');
    int distancia = (mapaNotas[i]['distancia'] - 1) as int;
    int midiNote = (mapaNotas[i]['midiNumber']) as int;

    return GestureDetector(
      onTapDown: (_) {
        print("tapped");
        // websocketChannel.sink.add("$midiNote");
      },
      // onTapUp: (_) {
      //   websocketChannel.sink.add("$midiNote");
      // },
      // onPanCancel: () => print('onPanCancel'),
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(
            left: isSharp
                ? (distancia * (keyWidth + keyPadding)) +
                    (keyWidth / 2) +
                    5.toDouble()
                : (distancia * (keyWidth + keyPadding)).toDouble()),
        color: isSharp ? Colors.red : Colors.deepPurpleAccent,
        height: isSharp ? (keyHeight) * 2.2 : double.maxFinite,
        width: isSharp ? (keyWidth) - 2 : keyWidth,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Flexible(
            child: Text(
              mapaNotas[i]['noteName'],
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF804545),
              ),
            ),
          ),
          Flexible(
            child: Text(
              mapaNotas[i]['octave'],
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF804545),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
