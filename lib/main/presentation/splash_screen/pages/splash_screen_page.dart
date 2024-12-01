
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_crypto/config/theme/app_themes.dart';
import 'package:realtime_crypto/core/constants/assets.dart';
import 'package:realtime_crypto/main/presentation/splash_screen/getx/splash_controller.dart';

class SplashScreenPage extends GetView<SplashController> {

  static const String routeName = '/splash-screen-page';
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(

          color: AppThemes.c0A3981

        ),
        child: Center(
          child: Image.asset(
            bitcoinIcon,
            width: 160,
          )
        )
      )
    );
  }
}
