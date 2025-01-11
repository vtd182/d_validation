part of 'validations.dart';

extension ValidEmailValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> validEmail({String? message, String? code}) {
    return use((value, entity) {
      if (RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
        return null;
      }

      final currentCode = code ?? Language.code.validEmail;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension ValidEmailNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validEmail({String? message, String? code}) {
    return use((value, entity) {
      if (value != null && RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
        return null;
      }

      final currentCode = code ?? Language.code.validEmail;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension ValidEmailOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validEmailOrNull({String? message, String? code}) {
    return use((value, entity) {
      if (value == null) return null;
      if (RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
        return null;
      }

      final currentCode = code ?? Language.code.validEmail;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}
