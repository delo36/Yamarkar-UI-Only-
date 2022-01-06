part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const homeScreen = _Paths.homeScreen;
  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.loginScreen;
  static const registerScreen = _Paths.registerScreen;
  static const categoryScreen = _Paths.categoryScreen;
  static const newAchivesScreen = _Paths.newAchivesScreen;

}

abstract class _Paths {
  static const homeScreen = '/homeScreen';
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const categoryScreen = '/categoryScreen';
  static const newAchivesScreen = '/newAchivesScreen';
}