
import 'package:get/get.dart';
import 'package:realtime_crypto/main/presentation/splash_screen/getx/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}