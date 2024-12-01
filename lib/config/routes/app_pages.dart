import 'package:get/get.dart';
import 'package:realtime_crypto/main/presentation/home/getx/home_binding.dart';
import 'package:realtime_crypto/main/presentation/home/pages/home_page.dart';
import 'package:realtime_crypto/main/presentation/splash_screen/getx/splash_binding.dart';
import 'package:realtime_crypto/main/presentation/splash_screen/pages/splash_screen_page.dart';

const initialPageRoute = SplashScreenPage.routeName;

final GetPage splashScreenPage = GetPage(
    name: SplashScreenPage.routeName,
    page: () => const SplashScreenPage(),
    binding: SplashBinding()
);

final pageRoutes = [
  splashScreenPage,

  GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding()
  ),
];