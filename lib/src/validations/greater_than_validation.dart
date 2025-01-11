part of 'validations.dart';

extension GreaterThanValidation on SimpleValidationBuilder<num> {
  SimpleValidationBuilder<num> greaterThan(
    num minValue, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value > minValue) return null;

      final currentCode = code ?? Language.code.greaterThan;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': '$minValue',
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension GreaterThanNullablealidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> greaterThan(
    num minValue, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && value > minValue) return null;

      final currentCode = code ?? Language.code.greaterThan;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': '$minValue',
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension GreaterThanOrNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> greaterThanOrNull(
    num minValue, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || value > minValue) return null;

      final currentCode = code ?? Language.code.greaterThan;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': '$minValue',
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}
