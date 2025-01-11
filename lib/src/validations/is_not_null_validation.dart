part of 'validations.dart';

/// Extension on [DValidationBuilder] for [T?] properties to add a not null validation.
///
/// This extension adds an `isNotNull` method that can be used to ensure that a value
/// is not null.
extension IsNotNullValidation<T extends Object> on SimpleValidationBuilder<T?> {
  /// Adds a validation rule that checks if the value is not null.
  ///
  /// [message] is the error message returned if the validation fails.
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [DValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.name, key: 'name') // required field
  ///   .isNotNull();
  /// ```
  ///
  /// String format args:
  /// - **{PropertyName}**: The name of the property.
  ///
  SimpleValidationBuilder<T> isNotNull({String? message, String? code}) {
    return useNotNull(
      (value, entity) {
        if (value != null) return null;

        final currentCode = code ?? Language.code.isNotNull;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
