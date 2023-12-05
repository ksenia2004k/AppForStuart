import 'package:flutter/material.dart';
import 'BudgetPlanner.dart';
import 'ExpensesRoute.dart';
import 'IncomeRoute.dart';

List<ChartSampleDataExpenses> listOfDataExpenses =
[
  ChartSampleDataExpenses(x: "Январь", y: 0),
  ChartSampleDataExpenses(x: "Февраль", y: 0),
  ChartSampleDataExpenses(x: "Март", y: 0),
  ChartSampleDataExpenses(x: "Апрель", y: 0),
  ChartSampleDataExpenses(x: "Май", y: 0),
  ChartSampleDataExpenses(x: "Июнь", y: 0),
  ChartSampleDataExpenses(x: "Июль", y: 0),
  ChartSampleDataExpenses(x: "Август", y: 0),
  ChartSampleDataExpenses(x: "Сентябрь", y: 0),
  ChartSampleDataExpenses(x: "Октябрь", y: 0),
  ChartSampleDataExpenses(x: "Ноябрь", y: 0),
  ChartSampleDataExpenses(x: "Декабрь", y: 0),
];

List<ChartSampleDataIncome> listOfDataIncome =
[
  ChartSampleDataIncome(x: "Январь", y: 0),
  ChartSampleDataIncome(x: "Февраль", y: 0),
  ChartSampleDataIncome(x: "Март", y: 0),
  ChartSampleDataIncome(x: "Апрель", y: 0),
  ChartSampleDataIncome(x: "Май", y: 0),
  ChartSampleDataIncome(x: "Июнь", y: 0),
  ChartSampleDataIncome(x: "Июль", y: 0),
  ChartSampleDataIncome(x: "Август", y: 0),
  ChartSampleDataIncome(x: "Сентябрь", y: 0),
  ChartSampleDataIncome(x: "Октябрь", y: 0),
  ChartSampleDataIncome(x: "Ноябрь", y: 0),
  ChartSampleDataIncome(x: "Декабрь", y: 0),
];

List<String> listOfMonths =
[
  "Январь",
  "Февраль",
  "Март",
  "Апрель",
  "Май",
  "Июнь",
  "Июль",
  "Август",
  "Сентябрь",
  "Октябрь",
  "Ноябрь",
  "Декабрь"
];

List<ListTile> listOfZam = [];

var listOfColors = <Color>[
  Color.fromRGBO(145, 145, 145, 0.08627450980392157),
  Color.fromRGBO(145, 145, 145, 0.08627450980392157),
  Color.fromRGBO(145, 145, 145, 0.08627450980392157),
  Color.fromRGBO(145, 145, 145, 0.08627450980392157)
];

void main() {
  runApp(const MyApp());
}