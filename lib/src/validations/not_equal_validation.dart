part of 'validations.dart';

extension NotEqualValidation<T, E> on DValidationBuilder<T, E> {
  DValidationBuilder<T, dynamic> notEqualTo(T Function(E entity) predicate, {String? message, String? code}) {
    return use(
      (value, entity) {
        final comparison = predicate(entity);
        if (value != comparison) return null;

        final currentCode = code ?? Language.code.notEqualTo;
        final currentMessage = DValidation.globalConfig.languageManager.translate(
          currentCode,
          parameters: {
            'PropertyName': label.isNotEmpty ? label : key,
            'ComparisonValue': '$comparison',
          },
          defaultMessage: message,
        );

        return ValidationException(message: currentMessage, code: currentCode);
      },
    );
  }
}
