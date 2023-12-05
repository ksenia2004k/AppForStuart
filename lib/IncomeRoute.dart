import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'main.dart';

class IncomeRoute extends StatefulWidget{
  const IncomeRoute({Key? key}) : super (key: key);

  @override
  State<IncomeRoute> createState() => _IncomeRouteState();
}

class _IncomeRouteState extends State<IncomeRoute> {

  final bool shouldAlwaysShowScrollbar = false;
  late String selectedMode;
  List<String>? modeList;
  late LegendItemOverflowMode overflowMode;
  late LegendPosition position;

  @override
  void initState() {
    selectedMode = "wrap";
    modeList = <String>["wrap", "none", "scroll"].toList();
    position = LegendPosition.auto;
    overflowMode = LegendItemOverflowMode.wrap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            onPressed: () {Navigator.of(context).pop();},
            ),
            title: const Text("Доходы"),
            titleTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          body: _buildLegendDefaultChart()
      ),
    );
  }

  //Функция построения диаграммы
  SfCircularChart _buildLegendDefaultChart(){
    return SfCircularChart(
      legend: Legend(
        textStyle: const TextStyle(color: Colors.white70,),
        position: position,
        isVisible: true,
        overflowMode: overflowMode,
        shouldAlwaysShowScrollbar: shouldAlwaysShowScrollbar,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getLegendDeaultSeries(),
    );
  }

  //Функция получения данных для диаграммы
  List<DoughnutSeries<ChartSampleDataIncome, String>> _getLegendDeaultSeries(){
    return <DoughnutSeries<ChartSampleDataIncome, String>>[
      DoughnutSeries<ChartSampleDataIncome, String>(
        dataSource: listOfDataIncome,
        xValueMapper: (ChartSampleDataIncome data, _) => data.x,
        yValueMapper: (ChartSampleDataIncome data, _) => data.y,
        startAngle: 90,
        endAngle: 90,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(color: Colors.white70,),
          labelPosition: ChartDataLabelPosition.outside,
          showZeroValue: false,
        )
      )
    ];
  }
}

class ChartSampleDataIncome
{
  final String x;
  final double y;
  ChartSampleDataIncome({required this.x, required this.y});
}

