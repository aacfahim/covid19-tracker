import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalStatScreen extends StatelessWidget {
  GlobalStatScreen({super.key});

  final chartColors = <Color>[
    Colors.blueAccent,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Global Stats")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        PieChart(
          chartRadius: MediaQuery.of(context).size.width * 0.4,
          dataMap: {
            "Total": 100,
            "Recovered": 80,
            "Death": 12,
          },
          legendOptions: LegendOptions(legendPosition: LegendPosition.left),
          chartType: ChartType.ring,
          colorList: chartColors,
        ),
      ]),
    );
  }
}
