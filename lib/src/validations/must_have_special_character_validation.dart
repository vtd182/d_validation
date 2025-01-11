part of 'validations.dart';

extension MustHaveSpecialCharacterValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> mustHaveSpecialCharacter({String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveSpecialCharacter;
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

extension MustHaveSpecialCharacterNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveSpecialCharacter({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value);
          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.mustHaveSpecialCharacter;
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

extension MustHaveSpecialCharacterOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveSpecialCharacterOrNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;
        final isValid = RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveSpecialCharacter;
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
