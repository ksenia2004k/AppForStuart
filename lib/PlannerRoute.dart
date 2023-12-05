import 'package:flutter/material.dart';
import 'package:projects/main.dart';

class PlannerRoute extends StatefulWidget {
  const PlannerRoute({Key? key}) : super(key: key);

  @override
  _PlannerRouteState createState() => _PlannerRouteState();
}

class _PlannerRouteState extends State<PlannerRoute>{

  final nameZam = TextEditingController();
  final contentZam = TextEditingController();

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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Заметки"),
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: (){
                  showDialog(context: context, builder: (BuildContext){
                    return AlertDialog(
                      title: const Text("Добавить заметку"),
                      titleTextStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                      ),
                      backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Название заметки",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            controller: nameZam,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Содержимое заметки",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 2,
                            controller: contentZam,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: (){
                            nameZam.clear();
                            contentZam.clear();
                            Navigator.of(context).pop();
                            },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                            side: const BorderSide(width: 2, color: Colors.white70),
                          ),
                          child: const Text("Закрыть", style: TextStyle(color: Colors.white70),),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(nameZam.text != "" || contentZam.text != ""){
                              setState(() {
                                ListTile newObj = ListTile(
                                  title: Text(
                                    nameZam.text,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(23, 24, 28, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Text(
                                    contentZam.text,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(23, 24, 28, 1),
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                listOfZam.add(newObj);
                                nameZam.clear();
                                contentZam.clear();
                                Navigator.of(context).pop();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                            side: const BorderSide(width: 2, color: Colors.white70),
                          ),
                          child: const Text("Добавить", style: TextStyle(color: Colors.white70),),
                        ),
                      ],
                    );
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                )
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listOfZam.length,
          itemBuilder: (context, index) {
            int colorIndex;
            if(index < listOfColors.length){colorIndex = index;}
            else{colorIndex = index % 4;}
            return Card(
              color: listOfColors[colorIndex % 4],
              child: listOfZam[index],
            );
          },
        ),
      ),
    );
  }
}