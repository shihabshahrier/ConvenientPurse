import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/controllers/profile_controller.dart';
import 'package:convenience_purse/services/firestore_services.dart';
import 'package:convenience_purse/views/profile_screen/components/info_card.dart';

import '../../controllers/auth_controller.dart';
import '../login_Screen/login.dart';
import 'components/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
      body: StreamBuilder(
          stream: FireStoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(mus),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topRight,

                      // edit profile button
                      child: Icon(Icons.edit, color: Colors.white),
                    )
                        .onTap(() {
                          controller.nameController.text = data['name'];

                          Get.to(() => EditProfile(
                                data: data,
                              ));
                        })
                        .box
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          // profile image

                          data['imgUrl'] == '' &&
                                  controller.profileImgPath.isEmpty
                              ? Image.asset(imgProfile,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover)
                                  .box
                                  .roundedFull
                                  .clip(Clip.antiAlias)
                                  .make()
                              : SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    data['imgUrl'],
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                "${data['email']}".text.white.make(),
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
                              child: "logout"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make())
                        ],
                      ).box.margin(const EdgeInsets.all(8)).make(),
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoCard(context.screenWidth, "${data["cart_count"]}",
                            "In Your Cart"),
                        infoCard(context.screenWidth, "${data["order_count"]}",
                            "Wishlist"),
                        infoCard(context.screenWidth,
                            "${data["wishlist_count"]}", "Orders"),
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
              );
            }
          }),
    ));
  }
}
