import 'package:convenience_purse/consts/consts.dart';
import '../../controllers/home_controller.dart';
import './home_screen.dart';
import '../category_screen/category.dart';
import '../cart_screen/cart.dart';
import '../profile_screen/profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBarItems = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 25,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 25,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 25,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 25,
          ),
          label: account),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          color: whiteColor,
          child: Obx(
            () => Expanded(
              child: navBody[controller.currentNavIndex.value],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            backgroundColor: whiteColor,
            selectedItemColor: const Color.fromARGB(255, 93, 63, 178),
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            items: navBarItems,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
