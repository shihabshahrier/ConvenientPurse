import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/views/profile_screen/components/info_card.dart';

import '../../controllers/auth_controller.dart';
import '../login_Screen/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.edit, color: Colors.white),
            )
                .onTap(() {})
                .box
                .margin(const EdgeInsets.symmetric(horizontal: 8))
                .make(),
            Row(
              children: [
                // edit button

                Image.asset(imgProfile,
                        width: 110, height: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      "John Doe".text.fontFamily(semibold).white.make(),
                      "someone@host.com".text.white.make(),
                    ])),
                10.heightBox,

                // logout button
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () async {
                      await Get.put(AuthController()).logout(context);
                      Get.offAll(() => const LoginScreen());
                    },
                    child: "logout".text.fontFamily(semibold).white.make())
              ],
            ).box.margin(const EdgeInsets.all(8)).make(),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCard(context.screenWidth, "00", "In Your Cart"),
                infoCard(context.screenWidth, "00", "Wishlist"),
                infoCard(context.screenWidth, "00", "Orders"),
              ],
            ),
            10.heightBox,
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    profileIcons[index],
                    width: 30,
                  ),
                  title: profileButtonslist[index]
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.white,
                );
              },
              itemCount: profileButtonslist.length,
            )
                .box
                .white
                .rounded
                .margin(const EdgeInsets.all(10))
                .padding(const EdgeInsets.symmetric(horizontal: 16))
                .shadow
                .make()
                .box
                .color(const Color.fromARGB(255, 104, 75, 184))
                .make(),
          ],
        ),
      )),
    );
  }
}
