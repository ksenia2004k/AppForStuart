import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget{
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
          automaticallyImplyLeading: true,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          title: const Text("Планировщик бюджета"),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 65),
                    fixedSize: const Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3215686274509804),
                  ),
                  onPressed: (){Navigator.of(context).pushNamed('/IncomeRoute');},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 60,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      Text("Доходы",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 65),
                    fixedSize: const Size(150, 200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    backgroundColor: const Color.fromRGBO(
                        0, 0, 0, 0.3215686274509804),
                  ),
                  onPressed: (){Navigator.of(context).pushNamed('/ExpensesRoute');},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 60,
                        color: Color.fromRGBO(
                            255, 255, 255, 1.0),
                      ),
                      Text("Расходы",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(
                              255, 255, 255, 0.9411764705882353),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 65),
                    fixedSize: const Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3215686274509804),
                  ),
                  onPressed: (){Navigator.of(context).pushNamed('/InputRoute');},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.input,
                        size: 60,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      Text("Данные",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 65),
                    fixedSize: const Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3215686274509804),
                  ),
                  onPressed: (){Navigator.of(context).pushNamed('/PlannerRoute');},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.create,
                        size: 60,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                      Text("Заметки",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}