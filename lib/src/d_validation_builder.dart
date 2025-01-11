import '../d_validation.dart';
import 'enum/cascade_mode.dart';

typedef RuleFunc<Entity> = ValidationException? Function(Entity entity);

typedef SimpleValidationBuilder<T> = DValidationBuilder<T, dynamic>;

abstract class DValidationBuilder<TProp, Entity> {
  final String key;
  final String label;
  final TProp Function(Entity entity) _selector;
  final List<RuleFunc<Entity>> _rules = [];
  var _mode = CascadeMode.continueExecution;
  DValidator<TProp>? _nestedValidator;
  final DValidator _dValidator;

  bool Function(Entity entity)? _condition;

  DValidationBuilder(this.key, this.label, this._selector, this._dValidator);

  String? Function([String?]) nestedByField(Entity entity, String key) {
    if (_nestedValidator == null) {
      return ([_]) => null;
    }

    return _nestedValidator!.byField(_selector(entity), key);
  }

  DValidationBuilder<TProp, Entity> must(bool Function(TProp value) validator, String message, String code) {
    ValidationException? callback(value, entity) {
      if (validator(value)) {
        return null;
      }
      return ValidationException(
        message: message,
        key: key,
        code: code,
      );
    }

    return use(callback);
  }

  DValidationBuilder<TProp, Entity> mustWith(
    bool Function(TProp value, Entity entity) validator,
    String message,
    String code,
  ) {
    return use(
      (value, entity) {
        if (validator(value, entity)) {
          return null;
        }

        return ValidationException(
          message: message,
          key: key,
          code: code,
        );
      },
    );
  }

  DValidationBuilder<TProp, Entity> use(
    ValidationException? Function(TProp value, Entity entity) rule,
  ) {
    _rules.add((entity) => rule(_selector(entity), entity));
    return this;
  }

  DValidationBuilder<T, Entity> useNotNull<T extends Object>(ValidationException? Function(TProp value, Entity entity) rule) {
    _rules.add((entity) => rule(_selector(entity), entity));

    final builder = _DValidationBuilder<T, Entity>(key, label, (Entity entity) {
      final value = _selector(entity) as T;
      return value;
    }, _dValidator);

    this._mode = CascadeMode.stopOnFirstFailure;

    _dValidator.addBuilder(builder);
    return builder;
  }

  CascadeMode getMode() {
    return this._mode;
  }

  DValidationBuilder<TProp, Entity> cascade(CascadeMode mode) {
    _mode = mode;
    return this;
  }

  void setValidator(DValidator<TProp> validator) {
    _nestedValidator = validator;
  }

  DValidationBuilder<TProp, Entity> when(bool Function(Entity entity) condition) {
    _condition = condition;
    return this;
  }

  List<ValidationException> executeRules(Entity entity) {
    final byPass = _condition?.call(entity) ?? true;
    if (!byPass) {
      return [];
    }

    final exceptions = <ValidationException>[];

    if (_nestedValidator != null) {
      final nestedExceptions = _nestedValidator!.validate(_selector(entity)).exceptions;
      exceptions.addAll(nestedExceptions);
    } else {
      for (var rule in _rules) {
        final exception = rule(entity);

        if (exception != null) {
          exceptions.add(exception);

          if (_mode == CascadeMode.stopOnFirstFailure) {
            break;
          }
        }
      }
    }

    return exceptions;
  }
}

class _DValidationBuilder<TProp, Entity> extends DValidationBuilder<TProp, Entity> {
  _DValidationBuilder(super.key, super.label, super.selector, super.lucid);
}
