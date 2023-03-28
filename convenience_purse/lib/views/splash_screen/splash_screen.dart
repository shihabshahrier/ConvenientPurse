import '../../consts/consts.dart';
import '../../common_widgets/applogo.dart';
import 'package:convenience_purse/views/login_Screen/login.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 63, 178),
      body: Center(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              icSplashBg,
              width: 300,
            ),
          ),
          20.heightBox,
          appLogo(),
          30.heightBox,
          appName.text.xl4.bold.white.make(),
          10.heightBox,
          appVersion.text.xl2.make(),
          const Spacer(),
          credits.text.xl2.make(),
          20.heightBox,
        ],
      )),
    );
  }
}
