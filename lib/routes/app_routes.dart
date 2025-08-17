import 'package:get/get.dart';
import 'package:intern_selection/screens/dhashboard_screen.dart';
import 'package:intern_selection/screens/splash_screen.dart';
import '../screens/login_screen.dart';


class AppPages {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const DETAILS = '/details';

  static final routes = [
     GetPage(name: SPLASH, page: () => SplashScreen()),
     GetPage(name: LOGIN, page: () => LoginScreen()),
     GetPage(name: DASHBOARD, page: () => DashboardScreen()),
   // GetPage(name: DETAILS, page: () => DetailsScreen()),
  ];
}