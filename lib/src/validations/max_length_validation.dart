part of 'validations.dart';

extension MaxLengthValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> maxLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value.length <= num) return null;

        final currentCode = code ?? Language.code.maxLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MaxLengthNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> maxLength(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value.length <= num) return null;

        final currentCode = code ?? Language.code.maxLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxLength': '$num',
            'TotalLength': '${value != null ? value.length : 0}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MaxLengthOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> maxLengthOrNull(int num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value.length <= num) return null;

        final currentCode = code ?? Language.code.maxLength;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxLength': '$num',
            'TotalLength': '${value.length}',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
