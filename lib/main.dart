import 'package:flutter/material.dart';
import 'package:speedometer/speedo_meter.dart';
import 'package:speedometer/stress_meter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home:  StressMeterScreen(),
    );
  }
}

