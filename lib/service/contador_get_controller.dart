import 'package:get/get.dart';

class ContadorGetController extends GetxController {
  var contador = 0.obs;
  incrementar() => contador++;
  decrementar() => contador--;
}