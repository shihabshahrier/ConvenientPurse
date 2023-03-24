import 'package:convenience_purse/consts/consts.dart';

Widget featureButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fitWidth,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .width(200)
      .white
      .roundedSM
      .padding(const EdgeInsets.all(4))
      .outerShadowSm
      .make();
}
