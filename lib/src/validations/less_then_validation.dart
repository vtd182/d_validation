part of 'validations.dart';

extension LessThanValidation on SimpleValidationBuilder<num> {
  SimpleValidationBuilder<num> lessThan(num maxValue, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value < maxValue) return null;

        final currentCode = code ?? Language.code.lessThan;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'ComparisonValue': '$maxValue',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension LessThanNullableValidation on SimpleValidationBuilder<num?> {
  SimpleValidationBuilder<num?> lessThan(num maxValue, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null && value < maxValue) return null;

        final currentCode = code ?? Language.code.lessThan;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'ComparisonValue': '$maxValue',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}

extension LessThanOrNullableValidation on SimpleValidationBuilder<num?> {
  /// Adds a validation rule that checks if the [num?] is less than [maxValue] or [null].
  ///
  /// [maxValue] is the value that the number must be less than.
  /// [message] is the error message returned if the validation fails. Defaults to "Must be less than $maxValue".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.discount, key: 'discount')
  ///   .lessThanOrNull(100);
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  /// - **{ComparisonValue}**: The value to compare against.
  ///
  SimpleValidationBuilder<num?> lessThanOrNull(num maxValue, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null || value < maxValue) return null;

        final currentCode = code ?? Language.code.lessThan;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'ComparisonValue': '$maxValue',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
