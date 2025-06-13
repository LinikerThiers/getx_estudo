import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/service/lista_tarefas_getx_controller.dart';

class TarefasPage extends StatelessWidget {
  final descricaoController = TextEditingController();
  final listaTarefasController = ListaTarefasGetxController();

  TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa", style: TextStyle(color: Colors.blueAccent),),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar", style: TextStyle(color: Colors.blueAccent),)),
                    TextButton(
                        onPressed: () async {
                          listaTarefasController
                              .adicionar(descricaoController.text);
                          Navigator.pop(context);
                        },
                        child: Text("Salvar", style: TextStyle(color: Colors.blueAccent),))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Apenas não concluídos",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Obx(() {
                        return Switch(
                          activeColor: Colors.blueAccent,
                          value: listaTarefasController.apenasNaoConcluidos,
                          onChanged:
                              listaTarefasController.setApenasNaoConcluidos,
                        );
                      })
                    ])),
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: listaTarefasController.tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = listaTarefasController.tarefas[index];
                    return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          listaTarefasController.excluir(tarefa.id);
                        },
                        key: Key(tarefa.descricao),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                            activeColor: Colors.blueAccent,
                              value: tarefa.concluido,
                              onChanged: (bool value) async {
                                listaTarefasController.alterar(
                                    tarefa.id, tarefa.descricao, value);
                              }),
                        ));
                  });
            }))
          ],
        ),
      ),
    );
  }
}
