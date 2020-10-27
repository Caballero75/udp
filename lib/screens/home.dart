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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  children: [
                    for (var i = 1; i < 25; i++)
                      Container(
                        padding: EdgeInsets.only(
                          left: ((i - 1) * 50).toDouble(),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.pink[400],
            child: Keyboard(
              sender: sender,
            ),
          ),
        ),
      ],
    );
  }
}
