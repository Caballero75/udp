import 'dart:io';

import 'package:get_ip/get_ip.dart';

import 'package:udp/udp.dart';

main() async {
  // send a simple string to a broadcast endpoint on port 65001.
  String ipAddress = await GetIp.ipAddress;

  print(ipAddress);

  var sender = await UDP.bind(
    Endpoint.any(
      // InternetAddress("192.168.0.6"),
      port: Port(65000),
    ),
  );

  var dataLength = await sender.send(
      "Hello World!!!".codeUnits,
      // [23, 24, 25, 66],
      Endpoint.unicast(
        // InternetAddress("127.0.0.1"),
        InternetAddress("192.168.0.6"),
        port: Port(43210),
      ));

  print("${dataLength} bytes sent.");
}
