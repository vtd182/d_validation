part of 'validations.dart';

extension MatchesPatternValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> matchesPattern(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        final isValid = RegExp(pattern).hasMatch(value);

        if (isValid) return null;

        final currentCode = code ?? Language.code.matchesPattern;
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

extension MatchesPatternNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> matchesPattern(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value != null) {
          final isValid = RegExp(pattern).hasMatch(value);

          if (isValid) return null;
        }

        final currentCode = code ?? Language.code.matchesPattern;
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

extension MatchesPatternOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> matchesPatternOrNull(String pattern, {String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;

        final isValid = RegExp(pattern).hasMatch(value);

        if (isValid) return null;

        final currentCode = code ?? Language.code.matchesPattern;
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
