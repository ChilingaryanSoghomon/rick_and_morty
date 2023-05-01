import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ric_and_morty/di/locator_service.dart' as di;
import 'package:ric_and_morty/generated/codegen_loader.g.dart';
import 'package:ric_and_morty/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await di.setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('hy'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}
