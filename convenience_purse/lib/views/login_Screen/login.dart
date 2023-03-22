import 'package:convenience_purse/common_widgets/bg_wid.dart';
import 'package:convenience_purse/common_widgets/applogo.dart';
import 'package:convenience_purse/consts/consts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Login".text.xl4.bold.white.size(10).make(),
              10.heightBox,
              
            ],
          ),
        ),
      ),
    );
  }
}
