import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartSampleData> chartData;
  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Germany',
          y: 128,
          secondSeriesYValue: 129,
          thirdSeriesYValue: 101),
      ChartSampleData(
          x: 'Russia', y: 123, secondSeriesYValue: 92, thirdSeriesYValue: 93),
      ChartSampleData(
          x: 'Norway', y: 107, secondSeriesYValue: 106, thirdSeriesYValue: 90),
      ChartSampleData(
          x: 'USA', y: 87, secondSeriesYValue: 95, thirdSeriesYValue: 71),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ColumnSeries<ChartSampleData, String>>[
          ColumnSeries<ChartSampleData, String>(
              dataSource: chartData,
              color: const Color.fromRGBO(252, 216, 20, 1),
              xValueMapper: (ChartSampleData sales, _) => sales.x,
              yValueMapper: (ChartSampleData sales, _) => sales.y,
              name: 'Gold'),
          ColumnSeries<ChartSampleData, String>(
              dataSource: chartData,
              color: const Color.fromRGBO(169, 169, 169, 1),
              xValueMapper: (ChartSampleData sales, _) => sales.x as String,
              yValueMapper: (ChartSampleData sales, _) =>
                  sales.secondSeriesYValue,
              name: 'Silver'),
          ColumnSeries<ChartSampleData, String>(
              dataSource: chartData,
              color: const Color.fromRGBO(205, 127, 50, 1),
              xValueMapper: (ChartSampleData sales, _) => sales.x as String,
              yValueMapper: (ChartSampleData sales, _) =>
                  sales.thirdSeriesYValue,
              name: 'Bronze')
        ],
        legend: Legend(
            isVisible: true,
            legendItemBuilder:
                (String name, dynamic series, dynamic point, int index) {
              return RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                    width: 87,
                    child: Row(children: <Widget>[
                      SizedBox(
                          child: Icon(
                        Icons.bar_chart,
                        color: series.color,
                      )),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(series.name),
                    ])),
              );
            }),
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x, this.y, this.secondSeriesYValue, this.thirdSeriesYValue});
  final String? x;
  final num? y;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
}
