part of 'validations.dart';

extension GreaterThanOrEqualToDateTimeValidation on SimpleValidationBuilder<DateTime> {
  SimpleValidationBuilder<DateTime> greaterThanOrEqualTo(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value.isAfter(comparison) || value.isAtSameMomentAs(comparison)) {
        return null;
      }

      final currentCode = code ?? Language.code.greaterThanOrEqualToDateTime;
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

extension GreaterThanOrEqualToDateTimeNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> greaterThanOrEqualTo(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && (value.isAfter(comparison) || value.isAtSameMomentAs(comparison))) {
        return null;
      }

      final currentCode = code ?? Language.code.greaterThanOrEqualToDateTime;
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

extension GreaterThanOrEqualToDateTimeOrNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> greaterThanOrEqualToOrNull(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || (value.isAfter(comparison) || value.isAtSameMomentAs(comparison))) {
        return null;
      }

      final currentCode = code ?? Language.code.greaterThanOrEqualToDateTime;
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
