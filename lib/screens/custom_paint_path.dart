import 'package:flutter/material.dart';

class CustomPaintPath extends StatelessWidget {
  const CustomPaintPath({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ), //You can Replace this with your desired WIDTH and HEIGHT
        painter: RPSCustomPainter(),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 1.00);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.40,
        size.width * 0.60, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.90, size.height * 0.40,
        size.width * 1.00, size.height * 1.00);
    path.lineTo(0, size.height * 1.00);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
