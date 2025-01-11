part of 'validations.dart';

extension NotEmptyValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> notEmpty({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value.isNotEmpty) return null;

        final currentCode = code ?? Language.code.notEmpty;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension NotEmptyNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> notEmpty({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value.isNotEmpty) return null;

        final currentCode = code ?? Language.code.notEmpty;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension NotEmptyOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> notEmptyOrNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value.isNotEmpty) return null;

        final currentCode = code ?? Language.code.notEmpty;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
