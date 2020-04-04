/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withSampleData() {
    return new GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('Jan', 5),
      new OrdinalSales('Fev', 25),
      new OrdinalSales('Mar', 210),
      new OrdinalSales('Abr', 75),
      new OrdinalSales('Maio', 5),
      new OrdinalSales('Jun', 25),
      new OrdinalSales('Jul', 210),
      new OrdinalSales('Ago', 75),
      new OrdinalSales('Set', 25),
      new OrdinalSales('Out', 210),
      new OrdinalSales('Nov', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('Jan', 12),
      new OrdinalSales('Fev', 24),
      new OrdinalSales('Mar', 350),
      new OrdinalSales('Abr', 150),
      new OrdinalSales('Maio',20),
      new OrdinalSales('Jun', 12),
      new OrdinalSales('Jul', 150),
      new OrdinalSales('Ago', 90),
      new OrdinalSales('Set', 15),
      new OrdinalSales('Out', 10),
      new OrdinalSales('Nov', 25),
    ];

    final mobileSalesData = [
      new OrdinalSales('Jan', 24),
      new OrdinalSales('Fev', 36),
      new OrdinalSales('Mar', 300),
      new OrdinalSales('Abr', 125),
      new OrdinalSales('Maio',10),
      new OrdinalSales('Jun', 16),
      new OrdinalSales('Jul', 125),
      new OrdinalSales('Ago', 75),
      new OrdinalSales('Set', 25),
      new OrdinalSales('Out', 30),
      new OrdinalSales('Nov', 50),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
