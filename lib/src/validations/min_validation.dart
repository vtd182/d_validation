part of 'validations.dart';

extension MinValidation on SimpleValidationBuilder<num> {
  SimpleValidationBuilder<num> min(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value >= num) return null;

        final currentCode = code ?? Language.code.min;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> min(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value >= num) return null;

        final currentCode = code ?? Language.code.min;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension MinOrNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> minOrNull(num num, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value >= num) return null;

        final currentCode = code ?? Language.code.min;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'MinValue': '$num',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
