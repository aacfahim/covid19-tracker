import 'package:covid19_tracker/data/model/world_stat_model.dart';
import 'package:covid19_tracker/data/services/stat_services.dart';
import 'package:covid19_tracker/presentation/widgets/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalStatScreen extends StatefulWidget {
  GlobalStatScreen({super.key});

  @override
  State<GlobalStatScreen> createState() => _GlobalStatScreenState();
}

class _GlobalStatScreenState extends State<GlobalStatScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  final chartColors = <Color>[
    Colors.blueAccent,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    StatServices statServices = StatServices();
    late final AnimationController _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    return Scaffold(
      appBar: AppBar(title: const Text("Global Stats")),
      body: ListView(children: [
        FutureBuilder(
          future: statServices.fetchWorldStatsRecords(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  PieChart(
                    chartRadius: MediaQuery.of(context).size.width * 0.4,
                    dataMap: {
                      "Total": double.parse(snapshot.data!.cases.toString()),
                      "Recovered":
                          double.parse(snapshot.data!.recovered.toString()),
                      "Death": double.parse(snapshot.data!.deaths.toString()),
                    },
                    chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true),
                    legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.left),
                    chartType: ChartType.ring,
                    colorList: chartColors,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.06),
                    child: Card(
                      child: Column(children: [
                        ReusableRow(
                            title: "Total",
                            value: snapshot.data!.cases.toString()),
                        ReusableRow(
                            title: "Death",
                            value: snapshot.data!.deaths.toString()),
                        ReusableRow(
                            title: "Recovered",
                            value: snapshot.data!.recovered.toString()),
                        ReusableRow(
                            title: "Active",
                            value: snapshot.data!.active.toString()),
                        ReusableRow(
                            title: "Critical",
                            value: snapshot.data!.critical.toString()),
                        ReusableRow(
                            title: "Today Deaths",
                            value: snapshot.data!.todayDeaths.toString()),
                        ReusableRow(
                            title: "Today Recovered",
                            value: snapshot.data!.todayRecovered.toString()),
                      ]),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.cyan),
                    child: const Center(child: Text("Track Countries")),
                  ),
                ],
              );
            } else {
              return Expanded(
                  flex: 1,
                  child: SpinKitFadingCircle(
                    controller: _controller,
                  ));
            }
          },
        ),
      ]),
    );
  }
}
