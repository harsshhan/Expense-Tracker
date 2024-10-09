import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }
  BarChartData mainBarData(){
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true,reservedSize: 38,getTitlesWidget: getTiles)
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true)
        )
      )
    );
  }
  Widget getTiles(double value, TitleMeta meta){
    style= TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14
    );
    Widget Text;
  }
}