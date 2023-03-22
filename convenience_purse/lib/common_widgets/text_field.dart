import 'package:convenience_purse/consts/consts.dart';

Widget textField() {
  return Column(children: [
    email.text.xl2.color(redColor).fontFamily(semibold).size(10).make(),
    5.heightBox,
    TextFormField(
      decoration: const InputDecoration(
        hintStyle: TextStyle(
          color: textfieldGrey,
          fontFamily: semibold,
        ),
        hintText: emailHint,
        isDense: true,
        fillColor: lightGrey,
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redColor, width: 1.0),
        ),
      ),
    )
  ]);
}
