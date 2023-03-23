import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/common_widgets/applogo.dart';
import 'package:convenience_purse/common_widgets/text_field.dart';
import 'package:convenience_purse/common_widgets/button.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:get/get.dart';

import '../signup_screen/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              10.heightBox,
              "Login".text.xl4.bold.white.size(10).make(),
              10.heightBox,
              Column(
                children: [
                  textField(hint: emailHint, title: email).paddingAll(10),
                  10.heightBox,
                  textField(hint: passwordHint, title: password).paddingAll(10),
                  5.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  button(
                    onPress: () {},
                    color: (redColor),
                    title: login,
                    textColor: whiteColor,
                  ).box.width(context.width - 100).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  button(
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    },
                    color: (whiteColor),
                    title: signup,
                    textColor: redColor,
                  ).box.width(context.width - 100).make(),
                  5.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialMIcons[index],
                              width: 30,
                            )),
                      ),
                    ),
                  ),
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
