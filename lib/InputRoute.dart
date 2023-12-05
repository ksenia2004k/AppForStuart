import 'package:flutter/material.dart';
import 'package:projects/ExpensesRoute.dart';
import 'main.dart';
import 'IncomeRoute.dart';


class InputRoute extends StatefulWidget{
  const InputRoute({super.key});

  @override
  State<InputRoute> createState() => _InputRouteState();
}

class _InputRouteState extends State<InputRoute> {

  final _IncomeController = TextEditingController();
  final _ExpensesController = TextEditingController();
  double incomeData = 0;
  double expensesData = 0;
  int _selectedIndex = -1;
  String Month = "";

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
          title: const Text("Ввод данных"),
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: listOfMonths.length,
            itemBuilder: (BuildContext context, int index){
              int colorIndex;
              if(index < listOfColors.length){colorIndex = index;}
              else{colorIndex = index % 4;}
              return Card(
                color: listOfColors[colorIndex % 4],
                child: ListTile(
                  title: Text(listOfMonths[index]),
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(23, 24, 28, 1),
                  ),
                  onTap: (){
                    setState(() {_selectedIndex = index;});
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text("Введите значение"),
                          titleTextStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 24,
                          ),
                          backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _IncomeController,
                                      decoration: const InputDecoration(
                                        hintText: "Доход",
                                        hintStyle: TextStyle(color: Colors.white70,),
                                        border: OutlineInputBorder(),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            incomeData = double.parse(_IncomeController.text);
                                            switch (_selectedIndex){
                                              case 0: Month = "Январь"; break;
                                              case 1: Month = "Февраль"; break;
                                              case 2: Month = "Март"; break;
                                              case 3: Month = "Апрель"; break;
                                              case 4: Month = "Май"; break;
                                              case 5: Month = "Июнь"; break;
                                              case 6: Month = "Июль"; break;
                                              case 7: Month = "Август"; break;
                                              case 8: Month = "Сентябрь"; break;
                                              case 9: Month = "Октябрь"; break;
                                              case 10: Month = "Ноябрь"; break;
                                              case 11: Month = "Декабрь"; break;
                                            }
                                            ChartSampleDataIncome newObj = ChartSampleDataIncome(x: Month, y: incomeData);
                                            listOfDataIncome[index] = newObj;
                                            _IncomeController.clear();
                                          });
                                        },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                                        side: const BorderSide(width: 2, color: Colors.white70),
                                      ),
                                      child: const Text("Добавить", style: TextStyle(color: Colors.white70),),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _ExpensesController,
                                      decoration: const InputDecoration(
                                        hintText: "Расход",
                                        hintStyle: TextStyle(color: Colors.white70,),
                                        border: OutlineInputBorder(),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            expensesData = double.parse(_ExpensesController.text);
                                            switch (_selectedIndex){
                                              case 0: Month = "Январь"; break;
                                              case 1: Month = "Февраль"; break;
                                              case 2: Month = "Март"; break;
                                              case 3: Month = "Апрель"; break;
                                              case 4: Month = "Май"; break;
                                              case 5: Month = "Июнь"; break;
                                              case 6: Month = "Июль"; break;
                                              case 7: Month = "Август"; break;
                                              case 8: Month = "Сентябрь"; break;
                                              case 9: Month = "Октябрь"; break;
                                              case 10: Month = "Ноябрь"; break;
                                              case 11: Month = "Декабрь"; break;
                                            }
                                            ChartSampleDataExpenses newObj = ChartSampleDataExpenses(x: Month, y: expensesData);
                                            listOfDataExpenses[index] = newObj;
                                            _ExpensesController.clear();
                                          });
                                        },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                                        side: const BorderSide(width: 2, color: Colors.white70),
                                      ),
                                      child: const Text("Добавить", style: TextStyle(color: Colors.white70),),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  _IncomeController.clear();
                                  _ExpensesController.clear();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                                  side: const BorderSide(width: 2, color: Colors.white70),
                                ),
                                child: const Text("Закрыть", style: TextStyle(color: Colors.white70),),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
            ),
      ),
    );
  }
}