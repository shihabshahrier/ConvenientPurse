import 'package:convenience_purse/common_widgets/button.dart';
import 'package:convenience_purse/consts/consts.dart';

class ItemsDetails extends StatelessWidget {
  final String title;
  const ItemsDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                // color: darkFontGrey,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                          itemCount: 3,
                          aspectRatio: 16 / 9,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              imgFc5,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          }),
                      10.heightBox,
                      "title".text.fontFamily(bold).color(darkFontGrey).make(),
                      10.heightBox,
                      VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "\$200".text.fontFamily(bold).color(redColor).make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "In House brand"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                5.heightBox,
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.messenger_rounded,
                                color: darkFontGrey),
                          ),
                        ],
                      )
                          .box
                          .height(70)
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),

                      20.heightBox,

                      // color Section

                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Color: "
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ),
                              Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .size(40, 40)
                                        .roundedFull
                                        .margin(const EdgeInsets.only(right: 8))
                                        .color(Vx.randomPrimaryColor)
                                        .make()),
                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          0.heightBox,

                          // quantity Section

                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity: "
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove)),
                                  "0"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                  "(0 left)"
                                      .text
                                      .fontFamily(semibold)
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          20.heightBox,

                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total: "
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ),
                              "\$0.00"
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .make(),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                      20.heightBox,
                      // description Section

                      "Description"
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      "this is a product".text.fontFamily(semibold).make(),
                      20.heightBox,

                      // button Section
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(
                            itemDetailButton.length,
                            (index) => ListTile(
                                  title: itemDetailButton[index]
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                )),
                      ),

                      20.heightBox,

                      // similar product Section

                      productUmayLike.text
                          .fontFamily(bold)
                          .color(darkFontGrey)
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
                                Image.asset(imgP1,
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
                )),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: button(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Add to cart",
            ),
          ),
        ],
      ),
    );
  }
}
