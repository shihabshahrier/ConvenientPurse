import 'package:convenience_purse/consts/consts.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Checkout".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
    );
  }
}
