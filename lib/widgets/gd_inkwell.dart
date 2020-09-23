import 'package:flutter/material.dart';

class GDImkwell extends StatelessWidget {
  const GDImkwell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () => print("object"),
        child: GestureDetector(
          onTapUp: (_) => print("onTapUp"),
          onTapDown: (details) => print("tapDown"),
          onLongPress: () => print("long_Press"),
          onLongPressEnd: (details) => print(details.globalPosition),
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
