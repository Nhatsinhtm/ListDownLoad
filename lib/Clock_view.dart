import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var centerX = size.width / 2;
    var centerY = size.height/ 2;
    var center = Offset(centerX, centerY);
    var radius =min(centerX, centerY);
    
    var fillBrush= Paint()
      ..color=const Color(0xFF444974);
    var outLineBrush = Paint()
      ..strokeWidth=8
      ..style = PaintingStyle.stroke
      ..color=Color(0xFFFFFFFF);
    var centerFillBrush= Paint()
      ..color=Color(0xFFFFFFFF);

    var secHandBrush = Paint()
      ..color=Colors.orange
      ..style=PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
    ..strokeWidth=12;
    var minHandBrush = Paint()
    ..shader=RadialGradient(colors: [Colors.lightGreen,Colors.lightBlue])
        .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style=PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=12;
    var hourHandBrush = Paint()
      ..shader=RadialGradient(colors: [Colors.lightGreen,Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style=PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=12;

    canvas .drawCircle(center, radius-40, fillBrush);
    canvas .drawCircle(center, radius-40, outLineBrush);



    var secHandx = centerX + 80 * cos(dateTime.second *6* pi /180);
    var secHandy = centerX + 80 * sin(dateTime.second*6* pi / 180);
    canvas.drawLine(center,Offset(secHandx, secHandy), secHandBrush);

    var minHandx = centerX + 80 * cos(dateTime.minute * 6 * pi /180);
    var minHandy = centerX + 80 * sin(dateTime.minute* 6 * pi / 180);
    canvas.drawLine(center,Offset(minHandx, minHandy), minHandBrush);


    var hourHandx = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5 )* pi /180);
    var hourHandy = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5 )* pi / 180);
    canvas.drawLine(center,Offset(hourHandx, hourHandy), hourHandBrush);
    canvas .drawCircle(center, radius-140, centerFillBrush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }
}
