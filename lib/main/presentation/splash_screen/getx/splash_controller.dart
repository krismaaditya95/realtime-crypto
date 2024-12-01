import 'dart:async';
import 'package:get/get.dart';
import 'package:realtime_crypto/main/presentation/home/pages/home_page.dart';

class SplashController extends GetxController{

  final title = "Splash";

  @override
  void onInit() async {
    super.onInit();
    Timer(const Duration(seconds: 3), () async => await redirect());
  }

  Future<void> redirect() async {
    Get.offAllNamed(HomePage.routeName);
  }
}