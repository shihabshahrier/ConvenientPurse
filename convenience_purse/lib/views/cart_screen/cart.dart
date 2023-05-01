import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convenience_purse/common_widgets/button.dart';
import 'package:convenience_purse/common_widgets/loading_indi.dart';
import 'package:convenience_purse/consts/consts.dart';
import 'package:convenience_purse/services/firestore_services.dart';

import '../../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingInditor(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No items in cart"
                  .text
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .make(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculatePrice(data);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: mus,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.network(
                            data[index]["imgUrl"],
                            width: 50,
                          ),
                          title:
                              "${data[index]["title"]} x ${data[index]["quantity"]}"
                                  .toString()
                                  .text
                                  .color(whiteColor)
                                  .fontFamily(semibold)
                                  .make(),
                          subtitle: "${data[index]['price']}"
                              .numCurrency
                              .text
                              .color(whiteColor)
                              .make(),
                          trailing: const Icon(Icons.delete, color: whiteColor)
                              .onTap(() {
                            FireStoreServices.deletedoc(data[index].id);
                          }),
                        );
                      },
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Total"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      Obx(() => "\$ ${controller.totalPrice.value}"
                          .text
                          .color(mus)
                          .fontFamily(semibold)
                          .make()),
                    ],
                  )
                      .box
                      .padding(const EdgeInsets.all(10))
                      .color(lightGrey)
                      .roundedSM
                      .make(),
                  SizedBox(
                    width: context.width - 50,
                    child: button(
                      title: "Checkout",
                      onPress: () {},
                      textColor: whiteColor,
                      color: mus,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
