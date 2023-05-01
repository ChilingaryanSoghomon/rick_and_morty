// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "characters_not_founds": "Characters not founds",
  "rick_and_morty": "Rick and Morty",
  "settings": "Settings",
  "language": "language",
  "english": "English",
  "russian": "Language",
  "armenian": "Armenian"
};
static const Map<String,dynamic> hy = {
  "characters_not_founds": "Պերսոնաժներ չեն գտնվել",
  "rick_and_morty": "Ռիկը և Մորտին",
  "settings": "Կարգավորումներ",
  "language": "Լեզու",
  "english": "Անգլերեն",
  "russian": "Ռուսերեն",
  "armenian": "Հայերեն"
};
static const Map<String,dynamic> ru = {
  "characters_not_founds": "Персонажи не найдены",
  "rick_and_morty": "Рик и Морти",
  "settings": "Настройки",
  "language": "Язык",
  "english": "Англиски",
  "russian": "Русский",
  "armenian": "Армянский"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "hy": hy, "ru": ru};
}
