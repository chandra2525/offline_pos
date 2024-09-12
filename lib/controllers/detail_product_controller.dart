import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailProductController extends GetxController {
  var isMore = false.obs;
  var loading = false.obs;
  var banyak = 0.obs;

  void increment() {
    banyak.value += 1;
  }

  void decrement() {
    if (banyak.value > 0) {
      banyak.value -= 1;
    }
  }

  String formatNumber(String s) {
    return NumberFormat.decimalPattern('id_ID').format(int.parse(s));
  }
}
