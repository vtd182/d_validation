part of 'validations.dart';

extension InclusiveBetweenDatetimeValidation on SimpleValidationBuilder<DateTime> {
  SimpleValidationBuilder<DateTime> inclusiveBetween({
    required DateTime start,
    required DateTime end,
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value.isAfter(start) || value.isAtSameMomentAs(start) && value.isBefore(end) || value.isAtSameMomentAs(end)) return null;

      final currentCode = code ?? Language.code.inclusiveBetweenDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'StartValue': start.toString(),
          'EndValue': end.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension InclusiveBetweenDatetimeNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> inclusiveBetween({
    required DateTime start,
    required DateTime end,
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value != null && (value.isAfter(start) || value.isAtSameMomentAs(start) && value.isBefore(end) || value.isAtSameMomentAs(end))) return null;

      final currentCode = code ?? Language.code.inclusiveBetweenDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'StartValue': start.toString(),
          'EndValue': end.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}

extension InclusiveBetweenDatetimeOrNullableValidation on SimpleValidationBuilder<DateTime?> {
  SimpleValidationBuilder<DateTime?> inclusiveBetweenOrNull({
    required DateTime start,
    required DateTime end,
    String? message,
    String? code,
  }) {
    return use((value, entity) {
      if (value == null || (value.isAfter(start) || value.isAtSameMomentAs(start) && value.isBefore(end) || value.isAtSameMomentAs(end))) return null;

      final currentCode = code ?? Language.code.inclusiveBetweenDatetime;
      final currentMessage = DValidation.globalConfig.languageManager.translate(
        currentCode,
        parameters: {
          'PropertyName': label.isNotEmpty ? label : key,
          'StartValue': start.toString(),
          'EndValue': end.toString(),
        },
        defaultMessage: message,
      );

      return ValidationException(message: currentMessage, code: currentCode);
    });
  }
}
