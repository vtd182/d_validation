import '../../d_validation.dart';

class StringValidator extends DValidator<String> {
  StringValidator() {
    ruleFor<String>((value) => value, key: 'email').validEmail();
  }
}
