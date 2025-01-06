import 'package:flutter/material.dart';
import 'dart:math';
class StressMeterScreen extends StatefulWidget {
  @override
  _StressMeterScreenState createState() => _StressMeterScreenState();
}

class _StressMeterScreenState extends State<StressMeterScreen> {
  double stressLevel = 0; // Value ranges from 0 to 100

  @override
  Widget build(BuildContext context) {
    return Scaffold(git remote add origin https://github.com/Anjor24/test-repo.git
      appBar: AppBar(
        title: Text('Stress Meter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(200, 150),
            painter: StressMeterPainter(stressLevel),
          ),
          SizedBox(height: 40),
          Text(
            'Stress Level: ${stressLevel.toStringAsFixed(0)}%',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: stressLevel,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${stressLevel.toStringAsFixed(0)}%',
            onChanged: (value) {
              setState(() {
                stressLevel = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class StressMeterPainter extends CustomPainter {
  final double stressLevel;

  StressMeterPainter(this.stressLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Offset center = Offset(width / 2, height * 1.5);

    // Draw background arcs for each section
    final List<Color> colors = [
      Colors.blue.shade900,
      Colors.grey.shade400,
      Colors.orange.shade200,
      Colors.orange.shade400,
      Colors.orange.shade600,
      Colors.red.shade900,
    ];

    final double segmentAngle = pi / 6;
    for (int i = 0; i < colors.length; i++) {
      final Paint paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: width * 0.8),
        pi + (i * segmentAngle),
        segmentAngle,
        true,
        paint,
      );
    }

    // Draw labels
    final List<String> labels = [
      "Very Low",
      "Low",
      "Moderate",
      "Warning",
      "High",
      "Very High"
    ];
    final double radius = width * 0.7;

    for (int i = 0; i < labels.length; i++) {
      final double angle = pi + (i * segmentAngle) + segmentAngle / 2;
      final double x = center.dx + cos(angle) * radius;
      final double y = center.dy + sin(angle) * radius;

      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }

    // Draw pointer based on stress level
    final Paint pointerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Map stress level (0-100) to angle (pi to 2*pi)
    final double pointerAngle = pi + (stressLevel / 100) * pi;
    final double pointerLength = radius * 0.7;
    final double pointerX = center.dx + cos(pointerAngle) * pointerLength;
    final double pointerY = center.dy + sin(pointerAngle) * pointerLength;

    // Draw the pointer
    canvas.drawLine(center, Offset(pointerX, pointerY), pointerPaint);
    canvas.drawCircle(center, 10, pointerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
