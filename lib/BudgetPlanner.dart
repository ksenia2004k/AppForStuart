import 'package:flutter/material.dart';
import 'HomeRoute.dart';
import 'IncomeRoute.dart';
import 'ExpensesRoute.dart';
import 'PlannerRoute.dart';
import 'InputRoute.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeRoute(),
      routes: <String, WidgetBuilder>{
        '/HomeRoute': (BuildContext context) => const HomeRoute(),
        '/IncomeRoute': (BuildContext context) => const IncomeRoute(),
        '/ExpensesRoute': (BuildContext context) => const ExpensesRoute(),
        '/PlannerRoute': (BuildContext context) => const PlannerRoute(),
        '/InputRoute': (BuildContext context) => const InputRoute(),
        '/InputRoute': (BuildContext context) => const InputRoute(),
      }
    );
  }
}
