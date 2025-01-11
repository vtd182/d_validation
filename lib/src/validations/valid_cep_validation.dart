part of 'validations.dart';

extension ValidCEPValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> validCEP({String? message, String? code}) {
    return use((value, entity) {
      if (RegExp(r'^\d{5}-?\d{3}$').hasMatch(value)) return null;

      final currentCode = code ?? Language.code.validCEP;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension ValidCEPNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCEP({String? message, String? code}) {
    return use((value, entity) {
      if (value != null && RegExp(r'^\d{5}-?\d{3}$').hasMatch(value)) {
        return null;
      }

      final currentCode = code ?? Language.code.validCEP;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension ValidCEPOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCEPOrNull({String? message, String? code}) {
    return use((value, entity) {
      if (value == null) return null;
      if (RegExp(r'^\d{5}-?\d{3}$').hasMatch(value)) return null;

      final currentCode = code ?? Language.code.validCEP;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}
