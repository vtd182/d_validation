part of 'validations.dart';

extension RangeValidation on SimpleValidationBuilder<num> {
  SimpleValidationBuilder<num> range(num min, num max, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value >= min && value <= max) return null;

        final currentCode = code ?? Language.code.range;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'From': '$min',
            'To': '$max',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension RangeNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> range(num min, num max, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value >= min && value <= max) return null;

        final currentCode = code ?? Language.code.range;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'From': '$min',
            'To': '$max',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension RangeOrNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> rangeOrNull(num min, num max, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;
        if (value >= min && value <= max) return null;

        final currentCode = code ?? Language.code.range;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'From': '$min',
            'To': '$max',
            'PropertyValue': '$value',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
