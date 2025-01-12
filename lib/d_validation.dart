library d_validation;

import 'd_validation.dart';

export 'src/base_model.dart';
export 'src/d_validation_builder.dart';
export 'src/d_validator.dart';
export 'src/localization/language_manager.dart';
export 'src/localization/localization.dart';
export 'src/types/types.dart';
export 'src/validations/validations.dart';
export 'src/widgets/d_validate_email_text_field.dart';
export 'src/widgets/string_validator.dart';

sealed class DValidation {
  static final globalConfig = _GlobalConfig(
    languageManager: DefaultLanguageManager(),
    cascadeMode: CascadeMode.continueExecution,
    culture: Culture('en'),
  );
}

class _GlobalConfig {
  LanguageManager languageManager;
  Culture culture;
  CascadeMode cascadeMode;

  _GlobalConfig({
    required this.languageManager,
    required this.cascadeMode,
    required this.culture,
  });
}
