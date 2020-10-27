import 'package:flutter/material.dart';
import 'package:udp/udp.dart';

import '../models/notas.dart';
import '../services/udp_helper.dart';

class KeyboardKey extends StatelessWidget {
  final UDP sender;
  final int index;
  final int initialNote;
  final int distanceFactor;
  final int sequence;
  final double keyWidth;
  final double keyHeight;
  final double keyPadding;
  KeyboardKey({
    Key key,
    this.sender,
    this.index,
    this.initialNote,
    this.distanceFactor,
    this.sequence,
    this.keyWidth,
    this.keyHeight,
    this.keyPadding,
  }) : super(key: key);

  Widget build(BuildContext context) {
    // print(keyWidth);
    int i = index;
    bool isSharp = mapaNotas[i]['noteName'].toString().contains('#');
    int distancia = (mapaNotas[i]['distancia'] - 1) as int;
    // int distancia = (mapaNotas[i]['distancia'] - 1) - distanceFactor as int;
    // int distancia = sequence;
    // print('i: $i distancia: $distancia');

    int midiNote = (mapaNotas[i]['midiNumber']) as int;

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.only(
        left: isSharp
            ? (distancia * (keyWidth + keyPadding)) +
                (keyWidth / 2) +
                5.toDouble()
            : (distancia * (keyWidth + keyPadding)).toDouble(),
      ),
      color: isSharp ? Colors.red : Colors.deepPurpleAccent[100],
      height: isSharp ? (keyHeight) * 2.6 : double.maxFinite,
      width: keyWidth,
      child: Listener(
        onPointerDown: (_) => UdpHelper.send(sender, 144, midiNote, 100),
        onPointerUp: (_) => UdpHelper.send(sender, 128, midiNote, 127),
        child: Container(
          color: isSharp ? Colors.red : Colors.deepPurpleAccent,
          padding: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: Text(
            '${mapaNotas[i]['noteName'] + mapaNotas[i]['octave']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isSharp ? Color(0xFF1866AF) : Color(0xFFCA0000),
            ),
          ),
        ),
      ),
    );
  }
}
