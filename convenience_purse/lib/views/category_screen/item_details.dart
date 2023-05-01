import 'package:convenience_purse/common_widgets/button.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/controllers/product_controller.dart';

class ItemsDetails extends StatelessWidget {
  final String title;
  final dynamic data;
  const ItemsDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValue();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetValue();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
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
                            itemCount: data['p_imgs'].length,
                            aspectRatio: 16 / 9,
                            itemBuilder: (context, index) {
                              return Image.network(
                                data['p_imgs'][index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                        10.heightBox,
                        "${data['p_name']}"
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        VxRating(
                          isSelectable: false,
                          value: double.parse(data['p_rating']),
                          onRatingUpdate: (value) {},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          maxRating: 5,
                          size: 25,
                          stepInt: true,
                        ),
                        10.heightBox,
                        "\$ ${data['p_price']}"
                            .text
                            .fontFamily(bold)
                            .color(redColor)
                            .make(),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['p_seller']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make(),
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

                        Obx(
                          () => Column(
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
                                        data['p_colors'].length,
                                        (index) => Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                VxBox()
                                                    .size(40, 40)
                                                    .roundedFull
                                                    .margin(
                                                        const EdgeInsets.only(
                                                            right: 8))
                                                    .color(Color(
                                                        data['p_colors']
                                                            [index]))
                                                    .make()
                                                    .onTap(() {
                                                  controller.colorIndex.value =
                                                      index;
                                                }),
                                                Visibility(
                                                  visible: index ==
                                                      controller
                                                          .colorIndex.value,
                                                  child: const Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )),
                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),
                              0.heightBox,

                              // quantity Section

                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "${data['p_quantity']} left"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                  ),
                                  Obx(
                                    () => Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.decrement();

                                              controller.calculateTotalPrice(
                                                  int.parse(data['p_price']));
                                            },
                                            icon: const Icon(Icons.remove)),
                                        controller.quantity.value.text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                        IconButton(
                                            onPressed: () {
                                              controller.increment(int.parse(
                                                  data['p_quantity']));

                                              controller.calculateTotalPrice(
                                                  int.parse(data['p_price']));
                                            },
                                            icon: const Icon(Icons.add)),
                                        "${data['p_quantity']} left"
                                            .text
                                            .fontFamily(semibold)
                                            .color(textfieldGrey)
                                            .make(),
                                      ],
                                    ),
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
                                  "${controller.totalPrice.value}"
                                      .numCurrency
                                      .text
                                      .fontFamily(bold)
                                      .color(redColor)
                                      .make(),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),
                            ],
                          ).box.white.shadowSm.make(),
                        ),
                        20.heightBox,
                        // description Section

                        "Description"
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "${data['p_description']}"
                            .text
                            .fontFamily(semibold)
                            .make(),
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
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
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
                                  Image.network(data['p_imgs'][0],
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
                onPress: () {
                  controller.addToCart(
                    title: data['p_name'],
                    imgUrl: data['p_imgs'][0],
                    color: data['p_colors'][controller.colorIndex.value],
                    quantity: controller.quantity.value,
                    price: controller.totalPrice.value,
                    seller: data['p_seller'],
                    context: context,
                  );
                  VxToast.show(
                    context,
                    msg: "Added to cart",
                    showTime: 2000,
                    bgColor: redColor,
                    textColor: whiteColor,
                  );
                },
                textColor: whiteColor,
                title: "Add to cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
