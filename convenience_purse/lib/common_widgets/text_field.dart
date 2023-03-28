import 'package:convenience_purse/consts/consts.dart';

Widget textField({String? title, String? hint, controller}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    title!.text.xl2
        .color(const Color.fromARGB(255, 93, 63, 178))
        .fontFamily(semibold)
        .size(10)
        .make(),
    5.heightBox,
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: textfieldGrey,
          fontFamily: semibold,
        ),
        hintText: hint,
        isDense: true,
        fillColor: lightGrey,
        filled: true,
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: redColor, width: 1.0),
        ),
      ),
    )
  ]);
}
