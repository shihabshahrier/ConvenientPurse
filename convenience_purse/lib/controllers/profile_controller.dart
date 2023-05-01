import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  var profileImgUrl = '';

  var nameController = TextEditingController();
  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();

  var isloading = false.obs;

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);

      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filepath = basename(profileImgPath.value);
    var destination = 'profilepic/${currentUser!.uid}/$filepath';

    Reference ref = FirebaseStorage.instance.ref(destination);

    await ref.putFile(File(profileImgPath.value));

    profileImgUrl = await ref.getDownloadURL();
    // print("profileImgUrl: $profileImgUrl");
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imgUrl': imgUrl,
    }, SetOptions(merge: true));

    isloading(false);
  }

  changeAuthpassword({email, password, newpassword}) async {
    final cred = EmailAuthProvider.credential(
        email: currentUser!.email!, password: password);

    await currentUser!
        .reauthenticateWithCredential(cred)
        .then((value) => currentUser!.updatePassword(newpassword))
        .catchError((error) {
      // print(error.toString());
    });
  }
}
