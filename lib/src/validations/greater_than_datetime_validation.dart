part of 'validations.dart';

extension GreaterThanDateTimeValidation on SimpleValidationBuilder<DateTime> {
  SimpleValidationBuilder<DateTime> greaterThan(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value.isAfter(comparison)) return null;

      final currentCode = code ?? Language.code.greaterThanDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': comparison.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension GreaterThanDateTimeNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> greaterThan(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && value.isAfter(comparison)) return null;

      final currentCode = code ?? Language.code.greaterThanDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': comparison.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension GreaterThanDateTimeOrNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> greaterThanOrNull(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || value.isAfter(comparison)) return null;

      final currentCode = code ?? Language.code.greaterThanDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'ComparisonValue': comparison.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}
