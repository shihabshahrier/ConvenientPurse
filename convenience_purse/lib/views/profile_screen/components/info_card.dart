import 'package:convenience_purse/consts/consts.dart';

Widget infoCard(width, String? count, String? title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      title!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      count!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width / 4)
      .height(60)
      .padding(const EdgeInsets.all(8))
      .make();
}
