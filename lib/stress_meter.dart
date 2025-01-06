// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class StressMeter extends StatefulWidget {
//   final double stressLevel; // Stress level from 0 to 100

//   StressMeter({required this.stressLevel});

//   @override
//   State<StressMeter> createState() => _StressMeterState();
// }

// class _StressMeterState extends State<StressMeter> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stress Meter'),
//       ),
//       body: Center(
//         child: SfRadialGauge(
//           axes: <RadialAxis>[
//             RadialAxis(
//               minimum: 0,
//               maximum: 100,
//               ranges: <GaugeRange>[
//                 GaugeRange(
//                   startValue: 0,
//                   endValue: 30,
//                   color: Colors.green,
//                 ),
//                 GaugeRange(
//                   startValue: 30,
//                   endValue: 70,
//                   color: Colors.orange,
//                 ),
//                 GaugeRange(
//                   startValue: 70,
//                   endValue: 100,
//                   color: Colors.red,
//                 ),
//               ],
//               pointers: <GaugePointer>[
//                 NeedlePointer(
//                   value: widget.stressLevel,
//                 ),
//               ],
//               annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                   widget: Text(
//                     '${widget.stressLevel}%',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   angle: 90,
//                   positionFactor: 0.5,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


