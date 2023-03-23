import 'package:get/get.dart';

import '../../common_widgets/applogo.dart';
import '../../common_widgets/bg_wid.dart';
import '../../common_widgets/button.dart';
import '../../common_widgets/text_field.dart';
import '../../consts/consts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              5.heightBox,
              "Sign Up".text.xl4.bold.white.size(8).make(),
              5.heightBox,
              Column(
                children: [
                  textField(hint: nameHint, title: name).paddingAll(10),
                  textField(hint: emailHint, title: email).paddingAll(10),
                  textField(hint: passwordHint, title: password).paddingAll(10),
                  textField(hint: passwordHint, title: confirmPassword)
                      .paddingAll(10),
                  5.heightBox,
                  button(
                    onPress: () {},
                    color: (redColor),
                    title: signup,
                    textColor: whiteColor,
                  ).box.width(context.width - 100).make(),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.red,
                        value: false,
                        onChanged: (newVal) {},
                      ),
                      5.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(color: fontGrey)),
                            TextSpan(
                                text: termCond,
                                style: TextStyle(color: redColor)),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(color: fontGrey)),
                            TextSpan(
                                text: priPolicy,
                                style: TextStyle(color: redColor)),
                          ],
                        )),
                      )
                    ],
                  ),
                  5.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAcc,
                          style: TextStyle(color: fontGrey),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(color: redColor),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
                  5.heightBox,
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(8))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
