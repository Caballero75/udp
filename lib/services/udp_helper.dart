import 'dart:io';

import 'package:udp/udp.dart';

class UdpHelper {
  static Future<UDP> init() async {
    final UDP sender = await UDP.bind(
      Endpoint.unicast(
        InternetAddress("192.168.0.7"),
        port: Port(65000),
      ),
    );
    print('Sender binded to ${sender.local.address}');
    return sender;
  }

  static void send(
    UDP sender,
    int action,
    int note,
    int velocity,
  ) async {
    var dataLength = await sender.send(
        // "Hello World!!!".codeUnits,
        // data,
        [action, note, velocity],
        Endpoint.unicast(
          // InternetAddress("127.0.0.1"),
          InternetAddress("192.168.0.21"),
          port: Port(43211),
        ));

    print("${dataLength} bytes sent.");
  }
}
