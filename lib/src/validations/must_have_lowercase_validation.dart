part of 'validations.dart';

extension MustHaveLowercaseValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> mustHaveLowercase({String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(r'[a-z]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveLowercase;
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

extension MustHaveLowercaseNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveLowercase({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(r'[a-z]').hasMatch(value);
          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.mustHaveLowercase;
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

extension MustHaveLowercaseOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> mustHaveLowercaseOrNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;
        final isValid = RegExp(r'[a-z]').hasMatch(value);
        if (isValid) return null;

        final currentCode = code ?? Language.code.mustHaveLowercase;
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
