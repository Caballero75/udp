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

int distanceFactor(int noteStart, int noteEnd) {
  bool isSharp;
  int distanceFactor = 0;
  for (int i = noteStart; i < noteEnd; i++) {
    if (!mapaNotas[i]['noteName'].toString().contains('#')) {
      distanceFactor++;
    }
  }
  return distanceFactor;
}

class _KeyboardState extends State<Keyboard> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int notesPerScreen = 12;
    int initialNote = 0;
    double keyPadding = 2;
    int distance = distanceFactor(initialNote, initialNote + notesPerScreen);
    double height = ((size.height) / 5) * 4;
    double width = size.width;
    double keyWidth = (width - (distance * keyPadding)) / distance;
    double keyHeight = height / 5;
    // print(notesPerScreen * keyPadding);
    // print('Distance: ${distance}');
    // print('whiteNotePerScreen: ${whiteNotePerScreen}');
    // print('width: ${(width - (notesPerScreen * keyPadding)) / distance}');
    // print('key Width: ${keyWidth}');

    return Stack(
      children: [
        for (int i = initialNote; i < notesPerScreen + initialNote; i++)
          KeyboardKey(
            sender: widget.sender,
            index: i,
            initialNote: initialNote,
            distanceFactor: distance,
            sequence: i - initialNote,
            keyWidth: keyWidth,
            keyHeight: keyHeight,
            keyPadding: keyPadding,
          ),
        for (int i = initialNote; i < notesPerScreen + initialNote; i++)
          KeyboardKey(
            sender: widget.sender,
            index: i,
            initialNote: initialNote,
            distanceFactor: distance,
            sequence: i - initialNote,
            keyWidth: keyWidth,
            keyHeight: keyHeight,
            keyPadding: keyPadding,
          )
      ],
    );
  }
}
