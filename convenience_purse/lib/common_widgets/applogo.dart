import 'package:convenience_purse/consts/consts.dart';

Widget appLogo() {
  return Image.asset(applogo)
      .box
      .white
      .border(color: const Color.fromARGB(255, 255, 255, 255), width: 2)
      .size(120, 120)
      .padding(const EdgeInsets.all(8))
      .roundedFull
      .make();
}
