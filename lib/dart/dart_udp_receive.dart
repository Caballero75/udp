import 'dart:io';
import 'package:udp/udp.dart';

main() async {
  var receiver = await UDP.bind(
    Endpoint.unicast(
      InternetAddress("192.168.0.21"),
      port: Port(43210),
    ),
  );

  if (receiver != null) {
    print("${receiver.local.address} : ${receiver.local.port}");
  } else
    print("null");

  // receiving\listening
  await receiver.listen((datagram) {
    var str = String.fromCharCodes(datagram.data);
    // var data = (datagram.data);
    print(str);
    // data.forEach((element) {
    //   print(element);
    // });
  });

  // close the UDP instances and their sockets.
}
