part of 'validations.dart';

extension IsNullValidation<T> on SimpleValidationBuilder<T?> {
  SimpleValidationBuilder<T?> isNull({String? message, String? code}) {
    return use(
      (value, entity) {
        if (value == null) return null;

        final currentCode = code ?? Language.code.isNull;
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
