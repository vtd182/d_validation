part of 'validations.dart';

extension IsEmptyValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> isEmpty({String? message, String? code}) {
    return use((value, entity) {
      if (value.isEmpty) return null;

      final currentCode = code ?? Language.code.isEmpty;
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

extension IsEmptyNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> isEmpty({String? message, String? code}) {
    return use((value, entity) {
      if (value != null && value.isEmpty) return null;

      final currentCode = code ?? Language.code.isEmpty;
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

extension IsEmptyOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> isEmptyOrNull({String? message, String? code}) {
    return use((value, entity) {
      if (value == null || value.isEmpty) return null;

      final currentCode = code ?? Language.code.isEmpty;
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
