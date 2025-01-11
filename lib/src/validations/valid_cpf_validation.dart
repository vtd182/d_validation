part of 'validations.dart';

extension ValidCPFValidation on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> validCPF({String? message, String? code}) {
    return use((value, entity) {
      if (_validateCPF(value)) return null;

      final currentCode = code ?? Language.code.validCPF;
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

extension ValidCPFNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCPF({String? message, String? code}) {
    return use((value, entity) {
      if (value != null && _validateCPF(value)) return null;

      final currentCode = code ?? Language.code.validCPF;
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

extension ValidCPFOrNullableValidation on SimpleValidationBuilder<String?> {
  SimpleValidationBuilder<String?> validCPFOrNull({String? message, String? code}) {
    return use((value, entity) {
      if (value == null || _validateCPF(value)) return null;

      final currentCode = code ?? Language.code.validCPF;
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

bool _validateCPF(String cpf) {
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
  if (cpf.length != 11) return false;

  for (int i = 0; i < 10; i++) {
    if (cpf == '$i' * 11) return false;
  }

  int add = 0;
  for (int i = 0; i < 9; i++) {
    add += int.parse(cpf[i]) * (10 - i);
  }
  int rev = 11 - (add % 11);
  if (rev == 10 || rev == 11) rev = 0;
  if (rev != int.parse(cpf[9])) return false;

  add = 0;
  for (int i = 0; i < 10; i++) {
    add += int.parse(cpf[i]) * (11 - i);
  }
  rev = 11 - (add % 11);
  if (rev == 10 || rev == 11) rev = 0;
  if (rev != int.parse(cpf[10])) return false;

  return true;
}
