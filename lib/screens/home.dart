import 'package:flutter/material.dart';
import 'package:udp/udp.dart';

import '../widgets/keyboard.dart';

class Home extends StatelessWidget {
  final UDP sender;
  const Home({
    Key key,
    this.sender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Color(0xFF239DC2),
            padding: EdgeInsets.all(12),
            child: Text("Menu"),
          ),
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Keyboard(sender: sender),
            // ,
          ),
        ),
      ],
    );
  }
}
