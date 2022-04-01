import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  void incrementCounter() {
    counter++;
    update();
  }

  void decrementCounter() {
    if (counter != 0) {
      counter--;
      update();
    }
    update();
  }
}
