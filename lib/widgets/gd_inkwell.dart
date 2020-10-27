import 'package:flutter/material.dart';

class GDImkwell extends StatelessWidget {
  const GDImkwell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        animationDuration: Duration(milliseconds: 200),
        // highlightColor: Colors.red[200],
        colorBrightness: Brightness.dark,
        splashColor: Colors.black54,
        hoverColor: Colors.teal,
        color: Colors.red[700],
        // onLongPress: () => {},
        onPressed: () => print("object"),
        child: GestureDetector(
          onTapUp: (details) => print("onTapUp"),
          onTapDown: (details) => print("tapDown"),
          onPanStart: (details) {},
          // onLongPress: () => {},
          // onLongPressEnd: (details) => print(details.globalPosition),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.transparent,
            child: Text("data!!!!!!!!!"),
          ),
        ),
      ),
    );
  }
}
