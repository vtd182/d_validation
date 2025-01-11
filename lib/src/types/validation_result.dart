import 'validation_exception.dart';

class ValidationResult {
  final bool isValid;

  final List<ValidationException> exceptions;

  const ValidationResult({
    required this.isValid,
    required this.exceptions,
  });
}
