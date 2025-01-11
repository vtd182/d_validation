part of 'validations.dart';

extension MustHaveUppercaseValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> mustHaveUppercase({String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(r'[A-Z]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveUppercase;
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

extension MustHaveUppercaseNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveUppercase({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(r'[A-Z]').hasMatch(value);
          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.mustHaveUppercase;
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

extension MustHaveUppercaseOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveUppercaseOrNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;
        final isValid = RegExp(r'[A-Z]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveUppercase;
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
