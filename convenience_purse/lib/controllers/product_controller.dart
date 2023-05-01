import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/models/category_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  getsubcategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString('lib/services/category_model.json');
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategories) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increment(q) {
    if (quantity.value < q) {
      quantity.value++;
    }
  }

  decrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }
}
