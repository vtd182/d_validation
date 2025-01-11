part of 'validations.dart';

extension ValidCreditCardValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> validCreditCard({String? message, String? code}) {
    return use((value, entity) {
      if (_validateCreditCard(value)) return null;

      final currentCode = code ?? Language.code.validCreditCard;
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

extension ValidCreditCardNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCreditCard({String? message, String? code}) {
    return use((value, entity) {
      if (value != null && _validateCreditCard(value)) return null;

      final currentCode = code ?? Language.code.validCreditCard;
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

extension ValidCreditCardOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCreditCardOrNull({String? message, String? code}) {
    return use((value, entity) {
      if (value == null) return null;
      if (_validateCreditCard(value)) return null;

      final currentCode = code ?? Language.code.validCreditCard;
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

bool _validateCreditCard(String number) {
  // Remove non-numeric characters
  number = number.replaceAll(RegExp(r'[^0-9]'), '');
  if (number.isEmpty || number.length < 13 || number.length > 19) {
    return false;
  }

  int sum = 0;
  bool alternate = false;

  for (int i = number.length - 1; i >= 0; i--) {
    int n = int.parse(number[i]);

    if (alternate) {
      n *= 2;
      if (n > 9) {
        n -= 9;
      }
    }

    sum += n;
    alternate = !alternate;
  }

  return (sum % 10 == 0);
}
