import 'package:d_validation/src/localization/languages/vietnamese_language.dart';

import '../../d_validation.dart';

final _availableLanguages = <Culture, Language>{
  Culture('en'): EnglishLanguage(),
  Culture('vi'): VietnameseLanguage(),
  Culture('en', 'US'): EnglishLanguage(),
  Culture('en', 'UA'): EnglishLanguage(),
};

abstract class LanguageManager {
  final _globalTranslations = <Culture, Map<String, String>>{};

  void addTranslation(Culture culture, String code, String value) {
    if (!_globalTranslations.containsKey(culture)) {
      _globalTranslations[culture] = {};
    }
    _globalTranslations[culture]![code] = value;
  }

  List<Culture> availableCultures() {
    return _availableLanguages.keys.toList();
  }

  bool isSupported(String languageCode, String? countryCode) {
    return _availableLanguages.containsKey(Culture(languageCode, countryCode ?? ''));
  }

  String translate(String key, {Map<String, String> parameters = const {}, String? defaultMessage}) {
    final culture = DValidation.globalConfig.culture;
    final currentLanguage = getLanguage(culture);
    final translations = _globalTranslations[culture] ?? {};
    var message = defaultMessage ?? translations[key] ?? currentLanguage.getTranslation(key) ?? key;
    for (var key in parameters.keys) {
      final value = parameters[key]!;
      message = message.replaceAll('{$key}', value);
    }
    return message;
  }

  Language getLanguage(Culture culture) {
    return _availableLanguages[culture] ?? _availableLanguages[Culture('en')]!;
  }
}

class DefaultLanguageManager extends LanguageManager {}
