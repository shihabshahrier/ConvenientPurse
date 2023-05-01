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

  addToCart({
    title,
    price,
    imgUrl,
    seller,
    color,
    quantity,
    context,
  }) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'color': color,
      'quantity': quantity,
      'seller': seller,
      'addedby': currentUser!.uid,
    }).catchError((e) {
      VxToast.show(context!,
          msg: e.toString(), bgColor: Colors.amber, textColor: whiteColor);
    });
  }

  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
    

  }
}
