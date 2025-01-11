part of 'validations.dart';

extension LessThanOrEqualToDatetimeValidation on SimpleValidationBuilder<DateTime> {
  SimpleValidationBuilder<DateTime> lessThanOrEqualTo(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value.isBefore(comparison) || value.isAtSameMomentAs(comparison)) {
        return null;
      }

      final currentCode = code ?? Language.code.lessThanOrEqualToDateTime;
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

extension LessThanOrEqualToDatetimeNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> lessThanOrEqualTo(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && (value.isBefore(comparison) || value.isAtSameMomentAs(comparison))) {
        return null;
      }

      final currentCode = code ?? Language.code.lessThanOrEqualToDateTime;
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

extension LessThanOrEqualToDatetimeOrNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> lessThanOrEqualToOrNull(
    DateTime comparison, {
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || (value.isBefore(comparison) || value.isAtSameMomentAs(comparison))) {
        return null;
      }

      final currentCode = code ?? Language.code.lessThanOrEqualToDateTime;
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
