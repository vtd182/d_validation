part of 'validations.dart';

extension EqualValidation<T, E> on DValidationBuilder<T, E> {
  DValidationBuilder<T, E> equalTo(
    T Function(E entity) predicate, {
    String? message,
    String? code,
  }) {
    return use(
      (value, entity) {
        final comparison = predicate(entity);
        if (value == comparison) return null;

        final currentCode = code ?? Language.code.equalTo;
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
