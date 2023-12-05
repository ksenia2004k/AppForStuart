import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'main.dart';

class ExpensesRoute extends StatefulWidget{
  const ExpensesRoute({Key? key}) : super (key: key);

  @override
  State<ExpensesRoute> createState() => _ExpensesRouteState();
}

class _ExpensesRouteState extends State<ExpensesRoute> {

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
          backgroundColor: Color.fromRGBO(35, 35, 45, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(35, 35, 45, 1),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {Navigator.of(context).pop();},
            ),
            title: const Text("Расходы"),
            titleTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          body:
          _buildLegendDefaultChart()
      ),
    );
  }

  //Функция построения диаграммы
  SfCircularChart _buildLegendDefaultChart(){
    return SfCircularChart(
      legend: Legend(
        textStyle: TextStyle(color: Colors.white70,),
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
  List<DoughnutSeries<ChartSampleDataExpenses, String>> _getLegendDeaultSeries(){
    return <DoughnutSeries<ChartSampleDataExpenses, String>>[
      DoughnutSeries<ChartSampleDataExpenses, String>(
          dataSource: listOfDataExpenses,
          xValueMapper: (ChartSampleDataExpenses data, _) => data.x,
          yValueMapper: (ChartSampleDataExpenses data, _) => data.y,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(color: Colors.white70,),
              showZeroValue: false,
              labelPosition: ChartDataLabelPosition.outside
          )
      )
    ];
  }
}

class ChartSampleDataExpenses
{
  final String x;
  final double y;
  ChartSampleDataExpenses({required this.x, required this.y});
}

