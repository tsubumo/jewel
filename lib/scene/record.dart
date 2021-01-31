// --------------------------------------------
// Record画面
// --------------------------------------------
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import './scene_manager.dart';

class RecordScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDbgTitle("Record")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("折れ線グラフ"),
            Text( '結構な感じ度の推移' ),
            Expanded(flex: 1,
                child: Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: SimpleTimeSeriesChart.withSampleData()
                    )
                )
            ),

          ],
        ),
      ),
    );
  }
}

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2020, 7, 19), 50),
      new TimeSeriesSales(new DateTime(2020, 7, 20), 25),
      new TimeSeriesSales(new DateTime(2020, 7, 21), 100),
      new TimeSeriesSales(new DateTime(2020, 7, 22), 75),
      new TimeSeriesSales(new DateTime(2020, 7, 23), 600),
      new TimeSeriesSales(new DateTime(2020, 7, 24), 60),
      new TimeSeriesSales(new DateTime(2020, 7, 25), 76),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
