import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/consts/consts.dart';

import 'each_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title:
                  categories.text.fontFamily(semibold).color(whiteColor).make(),
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 9,
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
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                    Get.to(() => EachCategory(title: categoriesList[index]));
                  });
                },
              ),
            )));
  }
}
