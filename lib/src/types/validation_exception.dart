class ValidationException {
  final String message;

  final String key;

  final String code;

  const ValidationException({
    required this.message,
    required this.code,
    this.key = '',
  });
}
