import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/models/category_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController {
  var subcat = [];

  getsubcategories(title) async {
    subcat.clear();
    var data =
        await rootBundle.loadString('lib/services/categories_model.json');
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategories) {
      subcat.add(e);
    }
  }
}
