// ignore_for_file: deprecated_member_use

import 'package:convenience_purse/consts/consts.dart';

Widget button({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: color, padding: const EdgeInsets.all(12)),
    onPressed: () {
      onPress();
    },
    child: Text(
      title!,
      style: TextStyle(color: textColor, fontFamily: semibold),
    ),
  );
}
