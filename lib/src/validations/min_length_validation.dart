part of 'validations.dart';

extension MinLengthValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> minLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinLengthNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> minLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value != null ? value.length : 0}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinLengthOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> minLengthOrNull(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value.length >= num) return null;

        final currentCode = code ?? Language.code.minLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
