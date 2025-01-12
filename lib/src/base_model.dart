import '../d_validation.dart';

class BaseValidator<T> extends DValidator<T> {
  BaseValidator();

  void defineRules(DValidator<T> validator) {}
}

abstract class BaseModel<T> {
  final BaseValidator<T> _validator = BaseValidator<T>();

  BaseModel() {
    defineRules(_validator);
    final result = _validator.validate(this as T);
    if (!result.isValid) {
      final message = result.exceptions.map((e) => e.message).join('\n');
      throw message;
    }
  }
  void defineRules(BaseValidator<T> validator);
}
