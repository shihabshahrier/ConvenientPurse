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
              // profile image
              data['imgUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile,
                          width: 110, height: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : data['imgUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imgUrl'],
                          width: 110,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
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
              10.heightBox,
              textField(
                hint: passwordHint,
                title: "Old Password",
                ispass: true,
                controller: controller.oldPassController,
              ),
              10.heightBox,
              textField(
                hint: passwordHint,
                title: "New Password",
                ispass: true,
                controller: controller.newPassController,
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

                            //if image is not selected
                            if (controller.profileImgPath.isEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImgPath = data['imgUrl'];
                            }

                            //if old password is correct
                            if (data['password'] ==
                                controller.oldPassController.text) {
                              await controller.changeAuthpassword(
                                  email: data['email'],
                                  password: controller.oldPassController.text,
                                  newpassword:
                                      controller.newPassController.text);

                              await controller.updateProfile(
                                  imgUrl: controller.profileImgPath.value,
                                  name: controller.nameController.text,
                                  password: controller.newPassController.text);

                              VxToast.show(
                                context,
                                msg: "Profile Updated",
                                bgColor: Colors.green,
                                textColor: Colors.white,
                                position: VxToastPosition.top,
                                showTime: 4000,
                              );
                            } else {
                              VxToast.show(
                                context,
                                msg: "Old Password is incorrect",
                                bgColor: Colors.red,
                                textColor: Colors.white,
                                position: VxToastPosition.top,
                                showTime: 4000,
                              );

                              controller.isloading(false);
                            }
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
