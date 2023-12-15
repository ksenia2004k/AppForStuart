import 'dart:async';
import 'package:projects/ExpensesRoute.dart';
import 'PlannerRoute.dart';
import 'database.dart';

abstract class DbEvent {}

class AllChartSampleDataExpensesEvent extends DbEvent{}

class SingleChartSampleDataExpensesEvent extends DbEvent{}


class NewChartSampleDataExpensesEvent extends DbEvent{
  late PlannerRoute _chartSampleDataExpenses;
  NewChartSampleDataExpensesEvent(PlannerRoute chartSampleDataExpenses){
    _chartSampleDataExpenses = chartSampleDataExpenses;
  }
}


class DbBloc{
  List<PlannerRoute> _list = [];

  final _listChartSampleDataExpensesStateController = StreamController<List<ChartSampleDataExpenses>>();

  StreamSink<List<ChartSampleDataExpenses>> get _inListChartSampleDataExpenses => _listChartSampleDataExpensesStateController.sink;

  Stream<List<ChartSampleDataExpenses>> get listChartSampleDataExpenses => _listChartSampleDataExpensesStateController.stream;

  final _dbEventController = StreamController<DbEvent>();

  Sink<DbEvent> get dbEventSink => _dbEventController.sink;

  DbBloc(){
    _dbEventController.stream.listen(_eventToState);
  }
  Future<void> _eventToState(DbEvent event) async {
    if(event is AllChartSampleDataExpensesEvent){
      _list = (await DBProvider.db.getAllChartSampleDataExpenses()).cast<PlannerRoute>();
    }else if(event is NewChartSampleDataExpensesEvent){
      DBProvider.db.newChartSampleDataExpenses(event._chartSampleDataExpenses as ChartSampleDataExpenses);
    }
    else{
      throw Exception('Error');
    }
   _inListChartSampleDataExpenses.add(_list.cast<ChartSampleDataExpenses>());
  }

  void disponse(){
    _dbEventController.close();
    _listChartSampleDataExpensesStateController.close();
  }
}


