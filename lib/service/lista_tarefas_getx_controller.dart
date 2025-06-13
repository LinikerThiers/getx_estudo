import 'package:get/get.dart';
import 'package:getx_app/models/tarefa.dart';

class ListaTarefasGetxController extends GetxController {
  List<Tarefa> get tarefas => _apenasNaoConcluidos.value
      ? _tarefas.where((e) => !e.concluido).toList().obs
      : _tarefas.toList().obs;
  var _apenasNaoConcluidos = false.obs;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;
  void setApenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos.value = value;
  }

  RxList<Tarefa> _tarefas = <Tarefa>[].obs;

  adicionar(String descricao) {
    _tarefas.add(Tarefa(descricao, false));
  }

  excluir(String id) {
    _tarefas.removeWhere((e) => e.id == id);
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((e) => e.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();
  }
}
