import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/service/contador_get_controller.dart';

class ContadorGetXPage extends StatelessWidget {
  ContadorGetXPage({super.key});
  final contadorGetXController = ContadorGetController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return Text(
            "${contadorGetXController.contador}",
            style: TextStyle(fontSize: 80, color: Colors.blueAccent),
          );
        }),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  contadorGetXController.decrementar();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  "Decrementar",
                  style: TextStyle(fontSize: 18),
                )),
            SizedBox(
              width: 15,
            ),
            TextButton(
                onPressed: () {
                  contadorGetXController.incrementar();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  "Incrementar",
                  style: TextStyle(fontSize: 18),
                )),
          ],
        )
      ],
    );
  }
}
