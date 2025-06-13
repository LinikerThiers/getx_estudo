import 'package:flutter/material.dart';
import 'package:getx_app/pages/contador_getx_page.dart';
import 'package:getx_app/pages/tarefas_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MobX",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                posicaoPagina = value;
              });
            },
            children: [
              ContadorGetxPage(),
              TarefasPage(),
            ],
          )),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.shade600, width: 1))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.blueAccent,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.blueAccent[800],
                currentIndex: posicaoPagina,
                type: BottomNavigationBarType.fixed,
                onTap: (value) => controller.jumpToPage(value),
                items: [
                  BottomNavigationBarItem(
                      label: "Contador", icon: Icon(Icons.numbers_rounded)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.checklist_rounded)),
                ]),
          )
        ],
      ),
    );
  }
}
