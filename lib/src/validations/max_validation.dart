part of 'validations.dart';

extension MaxValidation on SimpleValidationBuilder<num> {
  SimpleValidationBuilder<num> max(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value <= num) return null;

        final currentCode = code ?? Language.code.max;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MaxNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> max(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value <= num) return null;

        final currentCode = code ?? Language.code.max;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MaxOrNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> maxOrNull(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value <= num) return null;

        final currentCode = code ?? Language.code.max;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MaxValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
