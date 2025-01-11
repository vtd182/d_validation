part of 'validations.dart';

extension IsNotNullValidation<T extends Object> on SimpleValidationBuilder<T?> {
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
