import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/views/category_screen/item_details.dart';

import '../../controllers/product_controller.dart';

class EachCategory extends StatelessWidget {
  final String title;
  const EachCategory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    List.generate(
                        controller.subcat.length,
                        (index) => "${controller.subcat[index].text}"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .white
                            .roundedSM
                            .clip(Clip.antiAlias)
                            .outerShadowSm
                            .size(100, 50)
                            .margin(const EdgeInsets.all(4))
                            .make()).hStack(),
                  ],
                ),
              ),
              20.heightBox,
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
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
                          .outerShadowSm
                          .roundedSM
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemsDetails(
                              title: "DumDum",
                            ));
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
