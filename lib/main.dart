import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:realtime_crypto/config/app.dart';
import 'package:realtime_crypto/config/app_bindings.dart';
import 'package:realtime_crypto/config/env.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  AppEnvironment.setupEnv(Environment.dev);

  /// Init local directory for Hive/Local database
  // var appDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDir.path);

  final appBindings = AppBindings();
  await appBindings.dependencies();

  FlutterNativeSplash.remove();

  runApp(const App());
}
