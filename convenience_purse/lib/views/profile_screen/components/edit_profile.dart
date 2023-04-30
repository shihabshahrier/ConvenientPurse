import 'dart:io';

import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/common_widgets/button.dart';
import 'package:convenience_purse/common_widgets/text_field.dart';
import 'package:convenience_purse/controllers/profile_controller.dart';

import '../../../consts/consts.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile,
                          width: 110, height: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : Image.file(
                      File(controller.profileImgPath.value),
                      width: 110,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              button(
                  color: mus,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              textField(
                hint: nameHint,
                title: name,
                ispass: false,
                controller: controller.nameController,
              ),
              textField(
                hint: passwordHint,
                title: password,
                ispass: true,
                controller: controller.passController,
              ),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(mus),
                    )
                  : SizedBox(
                      width: context.screenWidth - 50,
                      child: button(
                          color: mus,
                          onPress: () async {
                            controller.isloading.value = true;
                            await controller.uploadProfileImage();
                            await controller.updateProfile(
                                imgUrl: controller.profileImgPath.value,
                                name: controller.nameController.text,
                                password: controller.passController.text);

                            controller.isloading.value = false;
                            Get.back();
                          },
                          textColor: whiteColor,
                          title: "save"),
                    )
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .rounded
              .margin(const EdgeInsets.only(top: 30, left: 13, right: 13))
              .make(),
        ),
      ),
    );
  }
}
