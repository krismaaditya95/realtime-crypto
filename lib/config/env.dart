import 'package:realtime_crypto/core/constants/constants.dart';

enum Environment { dev, sit, uat, prod }

abstract class AppEnvironment {

  static late Environment _environment;
  static late String baseApiUrl;
  static late String title;

  static Environment get environment => _environment;

  static setupEnv(Environment env){
    _environment = env;
    switch (env){
      case Environment.dev:
        {
          baseApiUrl = baseUrl;
          title = "Krisma Aditya's Realtime Crypto - DEV";
          break;
        }
      case Environment.sit:
        {
          baseApiUrl = baseUrl;
          title = "Krisma Aditya's Realtime Crypto - SIT";
          break;
        }
      case Environment.uat:
        {
          baseApiUrl = baseUrl;
          title = "Krisma Aditya's Realtime Crypto - UAT";
          break;
        }
      case Environment.prod:
        {
          baseApiUrl = baseUrl;
          title = "Krisma Aditya's Realtime Crypto";
          break;
        }
    }
  }
}