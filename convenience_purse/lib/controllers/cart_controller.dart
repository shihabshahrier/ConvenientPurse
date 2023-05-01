import 'package:convenience_purse/consts/consts.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  calculatePrice(data) {
    totalPrice.value = 0;
    for (int i = 0; i < data.length; i++) {
      totalPrice.value +=
          totalPrice.value + int.parse(data[i]['price'].toString());
    }
  }
}
