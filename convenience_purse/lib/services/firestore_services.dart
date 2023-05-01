import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/models/category_model.dart';

class FireStoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('addedby', isEqualTo: uid)
        .snapshots();
  }

  static deletedoc(did) {
    return firestore.collection(cartCollection).doc(did).delete();
  }
}
