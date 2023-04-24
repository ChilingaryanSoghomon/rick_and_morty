import 'package:flutter/material.dart';
import 'package:ric_and_morty/locator_service.dart' as di;
import 'package:ric_and_morty/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await di.setup();
  runApp(const MyApp());
}
