import '../d_validation.dart';

abstract class DValidator<E> {
  final List<DValidationBuilder<dynamic, E>> _builders = [];

  addBuilder(DValidationBuilder<dynamic, E> builder) {
    this._builders.add(builder);
  }

  DValidationBuilder<TProp, E> ruleFor<TProp>(TProp Function(E entity) selector, {required String key, String label = ''}) {
    final builder = _DValidationBuilder<TProp, E>(key, label, selector, this);
    _builders.add(builder);

    return builder;
  }

  String? Function([String?]) byField(E entity, String key) {
    if (key.contains('.')) {
      final keys = key.split('.');

      final firstKey = keys.removeAt(0);
      final builder = _getBuilderByKey(firstKey);
      if (builder == null) {
        return ([_]) => null;
      }

      return builder.nestedByField(entity, keys.join('.'));
    } else {
      final builder = _getBuilderByKey(key);

      if (builder == null) {
        return ([_]) => null;
      }

      return ([_]) {
        final errors = builder.executeRules(entity);
        if (errors.isNotEmpty) {
          return errors.first.message;
        }
        return null;
      };
    }
  }

  DValidationBuilder? _getBuilderByKey(String key) {
    return _builders
        .where(
          (builder) => builder.key == key,
        )
        .firstOrNull;
  }

  ValidationResult validate(E entity) {
    final List<ValidationException> exceptions = [];

    for (var builder in _builders) {
      exceptions.addAll(builder.executeRules(entity));
      if (builder.getMode() == CascadeMode.stopOnFirstFailure && exceptions.isNotEmpty) {
        break;
      }
    }

    return ValidationResult(
      isValid: exceptions.isEmpty,
      exceptions: exceptions,
    );
  }
}

class _DValidationBuilder<TProp, Entity> extends DValidationBuilder<TProp, Entity> {
  _DValidationBuilder(super.key, super.label, super.selector, super.lucid);
}
