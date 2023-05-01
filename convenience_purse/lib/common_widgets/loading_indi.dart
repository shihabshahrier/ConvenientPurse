import 'package:convenience_purse/consts/consts.dart';

Widget loadingInditor() {
  return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(redColor));
}
