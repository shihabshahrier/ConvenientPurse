import 'package:convenience_purse/consts/consts.dart';

Widget appLogo() {
  return Image.asset(icAppLogo)
      .box
      .color(Colors.white)
      .border(color: const Color.fromARGB(255, 255, 255, 255), width: 2)
      .size(100, 100)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
