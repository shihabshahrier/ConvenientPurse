import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  // text editing controllers

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // login
  Future<UserCredential?> login({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // register

  Future<UserCredential?> register({email, password, context, name}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // store user data

  storeUserData({name, email, password}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imgUrl': '',
      'id': currentUser!.uid,
      'order_count': '00',
      'cart_count': '00',
      'wishlist_count': '00',
    });
  }

  // logout
  logout(context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
