part of 'validations.dart';

extension LessThanDatetimeValidation on SimpleValidationBuilder<DateTime> {
  SimpleValidationBuilder<DateTime> lessThan(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value.isBefore(comparison)) return null;

      final currentCode = code ?? Language.code.lessThanDateTime;
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

extension LessThanDatetimeNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> lessThan(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && value.isBefore(comparison)) return null;

      final currentCode = code ?? Language.code.lessThanDateTime;
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

extension LessThanDatetimeOrNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> lessThanOrNull(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || value.isBefore(comparison)) return null;

      final currentCode = code ?? Language.code.lessThanDateTime;
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
