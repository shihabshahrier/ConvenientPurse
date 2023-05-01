import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/controllers/product_controller.dart';

import 'each_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title:
                  categories.text.fontFamily(semibold).color(whiteColor).make(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Image.asset(
                          categoryImages[index],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        20.heightBox,
                        categoriesList[index]
                            .text
                            .align(TextAlign.center)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      ],
                    )
                        .box
                        .white
                        .roundedSM
                        .margin(const EdgeInsets.symmetric(vertical: 8))
                        .clip(Clip.antiAlias)
                        .outerShadowSm
                        .make()
                        .onTap(() {
                      controller.getsubcategories(categoriesList[index]);
                      Get.to(() => EachCategory(title: categoriesList[index]));
                    });
                  },
                ),
              ),
            )));
  }
}
