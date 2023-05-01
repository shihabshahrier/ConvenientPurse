import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/common_widgets/loading_indi.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/services/firestore_services.dart';
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
        body: StreamBuilder(
          stream: FireStoreServices.getProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingInditor(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: 'No Products Found'.text.make(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Container(
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
                          itemCount: data.length,
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
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                // 5.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                5.heightBox,
                                '\$ ${data[index]['p_price']}'
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
                              Get.to(() => ItemsDetails(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ));
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
