import 'package:get/get.dart';
import 'package:yamakar/app/screens/achives/achives_binding.dart';
import 'package:yamakar/app/screens/achives/achives_screen.dart';
import 'package:yamakar/app/screens/category/category_binding.dart';
import 'package:yamakar/app/screens/category/category_screen.dart';
import 'package:yamakar/app/screens/login/login_screen.dart';
import 'package:yamakar/app/screens/register/register_screen.dart';


import '../screens/home/home_binding.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/splash/splash_screen.dart';




part 'app_routes.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [

    GetPage(
        name: Routes.homeScreen,
        page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.categoryScreen,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.newAchivesScreen,
      page: () => AchivesScreen(),
      binding: AchivesBinding(),
    ),
  ];
}