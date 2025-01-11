part of 'validations.dart';

extension MustHaveNumbersValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> mustHaveNumber({String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(r'[0-9]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveNumber;
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

extension MustHaveNumbersNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveNumber({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(r'[0-9]').hasMatch(value);
          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.mustHaveNumber;
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

extension MustHaveNumbersOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveNumberOrNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;
        final isValid = RegExp(r'[0-9]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveNumber;
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
