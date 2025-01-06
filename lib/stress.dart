import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StressMeterScreenn extends StatefulWidget {
  @override
  _StressMeterScreennState createState() => _StressMeterScreennState();
}

class _StressMeterScreennState extends State<StressMeterScreenn> {
  double stressLevel = 50; // Initial stress level (0-100)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stress Meter'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 20,
                    color: Colors.blue.shade900,
                    label: 'Very Low',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                  GaugeRange(
                    startValue: 20,
                    endValue: 40,
                    color: Colors.grey.shade400,
                    label: 'Low',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                  GaugeRange(
                    startValue: 40,
                    endValue: 60,
                    color: Colors.orange.shade200,
                    label: 'Moderate',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                  GaugeRange(
                    startValue: 60,
                    endValue: 80,
                    color: Colors.orange.shade600,
                    label: 'Warning',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                  GaugeRange(
                    startValue: 80,
                    endValue: 90,
                    color: Colors.red.shade400,
                    label: 'High',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                  GaugeRange(
                    startValue: 90,
                    endValue: 100,
                    color: Colors.red.shade900,
                    label: 'Very High',
                    labelStyle: GaugeTextStyle(fontSize: 10),
                  ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: stressLevel,
                    needleColor: Colors.grey,
                    knobStyle: KnobStyle(color: Colors.grey, sizeUnit: GaugeSizeUnit.factor, knobRadius: 0.08),
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text(
                      '${stressLevel.toStringAsFixed(0)}%',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    positionFactor: 0.8,
                    angle: 90,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
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
