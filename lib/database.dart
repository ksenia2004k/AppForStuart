import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projects/ExpensesRoute.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider._instance();
  DBProvider._instance();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var documentDirectory = await getDatabasesPath();
    String path =join(documentDirectory, 'TestDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE chartSampleDataExpenses ("
          " id INTEGER PRIMARY KEY,"
          " x TEXT,"
          " y TEXT)"
        );
    });
  }

  Future<List<ChartSampleDataExpenses>> getAllChartSampleDataExpenses() async {
    final db = await database;
    var result = await db?.rawQuery("SELECT * FROM chartSampleDataExpenses");
    List<ChartSampleDataExpenses>? list = (result?.isNotEmpty ??  false) ?
            result?.map((e) => ChartSampleDataExpenses.fromMap(e)).toList() ?? [] : [];
    return list;
  }

  newChartSampleDataExpenses(ChartSampleDataExpenses chartSampleDataExpenses) async {
    final db = await database;
    var  query = await db?.rawQuery('SELECT MAX(id) as id FROM chartSampleDataExpenses');
    int id = int.parse((query?.first['id'] ?? "0" ).toString());
    id += 1;
    var raw = await db?.rawInsert(
        " INSERT into student(id, x, y)"
        " VALUES(?,?,?) ", [id, chartSampleDataExpenses.x, chartSampleDataExpenses.y]);
    return raw;
  }

  singleChartSampleDataExpenses(ChartSampleDataExpenses chartSampleDataExpenses) async {
    final db = await database;
    ChartSampleDataExpenses singleStudent = ChartSampleDataExpenses(
        x: chartSampleDataExpenses.x,
        y: chartSampleDataExpenses.y,
       );
  }

  getNotSingleChartSampleDataExpenses() {}
}
