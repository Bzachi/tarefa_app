import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  List<String> tarefas = [
    "Pagar contas",
    "Comprar Roupa",
    "Comida para o Bruno",
  ];

  String novaTarefa = "";

  void addTarefa() {
    if (novaTarefa != "") {
      setState(() {
        tarefas.add(novaTarefa);
      });
    }
  }

  void removeTarefa(String tarefa) {
    tarefas.remove(tarefa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
        ),
        backgroundColor: Colors.deepOrange,
        title: Text("Tarefas", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ...tarefas.map(
              (tarefas) => GestureDetector(
                onTap: () {
                  removeTarefa(tarefas);
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(tarefas),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  onChanged: (valor) {
                    novaTarefa = valor;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  addTarefa();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
