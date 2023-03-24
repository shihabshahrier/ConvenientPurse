import 'package:convenience_purse/consts/consts.dart';

Widget homeButton({width, height, icon, title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      5.heightBox,
      Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ).box.rounded.size(width, height).white.shadowSm.make();
}
