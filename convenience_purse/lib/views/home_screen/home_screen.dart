import 'package:convenience_purse/common_widgets/home_buttons.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/views/home_screen/components/feature_button.dart';
import 'package:convenience_purse/views/login_Screen/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.width,
      height: context.height,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: textfieldGrey,
                  ),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchHint,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Swiper Brands
                    VxSwiper.builder(
                      aspectRatio: 2.5,
                      height: 140,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: firstsliderlist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          firstsliderlist[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todaysDeal : flashSale,
                          onPress: () {
                            Get.offAll(() => const LoginScreen());
                          },
                        ),
                      ),
                    ),
                    10.heightBox,

                    // 2nd swipper
                    VxSwiper.builder(
                      aspectRatio: 2.5,
                      height: 140,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: secondSliderlist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderlist[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),

                    10.heightBox,

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(
                    //       3,
                    //       (index) => homeButton(
                    //             height: context.screenHeight * 0.15,
                    //             width: context.screenWidth / 3.5,
                    //             icon: index == 0
                    //                 ? icTopCategories
                    //                 : index == 1
                    //                     ? icBrands
                    //                     : icTopSeller,
                    //             title: index == 0
                    //                 ? topCategories
                    //                 : index == 1
                    //                     ? brand
                    //                     : topSeller,
                    //           )),
                    // ),

                    // 20.heightBox,

                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),

                    20.heightBox,

                    // Featured Categories

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featureButton(
                                        icon: featuredImages1[index],
                                        title: freaturedTitles1[index]),
                                    10.heightBox,
                                    featureButton(
                                        icon: featuredImages2[index],
                                        title: freaturedTitles2[index]),
                                  ],
                                )).toList(),
                      ),
                    ),

                    // Featured Products

                    10.heightBox,

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 93, 63, 178),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featureproduct.text
                              .color(whiteColor)
                              .size(18)
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                6,
                                (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(p2,
                                        width: 150, fit: BoxFit.cover),
                                    10.heightBox,
                                    'Product Name'
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "\$ 100"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.only(right: 10))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(8))
                                    .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    20.heightBox,

                    // 3nd swipper

                    // VxSwiper.builder(
                    //   aspectRatio: 2.5,
                    //   height: 140,
                    //   autoPlay: true,
                    //   enlargeCenterPage: true,
                    //   itemCount: secondSliderlist.length,
                    //   itemBuilder: (context, index) {
                    //     return Image.asset(
                    //       secondSliderlist[index],
                    //       fit: BoxFit.fill,
                    //     )
                    //         .box
                    //         .rounded
                    //         .clip(Clip.antiAlias)
                    //         .margin(const EdgeInsets.symmetric(horizontal: 8))
                    //         .make();
                    //   },
                    // ),

                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              p1,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            // 5.heightBox,
                            'Product Name'
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            5.heightBox,
                            "\$ 100"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.all(4))
                            .padding(const EdgeInsets.all(8))
                            .roundedSM
                            .make();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
