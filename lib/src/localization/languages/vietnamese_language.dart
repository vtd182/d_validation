import 'package:d_validation/src/localization/language.dart';

import '../../../d_validation.dart';

class VietnameseLanguage extends Language {
  VietnameseLanguage()
      : super(
          {
            Language.code.equalTo: "'{PropertyName}' phải bằng '{ComparisonValue}'.",
            Language.code.greaterThan: "'{PropertyName}' phải lớn hơn '{ComparisonValue}'.",
            Language.code.isEmpty: "'{PropertyName}' phải rỗng.",
            Language.code.isNotNull: "'{PropertyName}' không được là null.",
            Language.code.isNull: "'{PropertyName}' phải là null.",
            Language.code.lessThan: "'{PropertyName}' phải nhỏ hơn '{ComparisonValue}'.",
            Language.code.matchesPattern: "'{PropertyName}' không đúng định dạng.",
            Language.code.max: "'{PropertyName}' phải nhỏ hơn hoặc bằng {MaxValue}. Giá trị bạn nhập là {PropertyValue}.",
            Language.code.maxLength: "Độ dài của '{PropertyName}' phải nhỏ hơn hoặc bằng {MaxLength} ký tự. Bạn đã nhập {TotalLength} ký tự.",
            Language.code.min: "'{PropertyName}' phải lớn hơn hoặc bằng {MinValue}. Giá trị bạn nhập là {PropertyValue}.",
            Language.code.minLength: "Độ dài của '{PropertyName}' phải ít nhất {MinLength} ký tự. Bạn đã nhập {TotalLength} ký tự.",
            Language.code.mustHaveLowercase: "'{PropertyName}' phải có ít nhất một chữ cái thường.",
            Language.code.mustHaveNumber: "'{PropertyName}' phải có ít nhất một chữ số ('0'-'9').",
            Language.code.mustHaveSpecialCharacter: "'{PropertyName}' phải có ít nhất một ký tự không phải chữ số hoặc chữ cái.",
            Language.code.mustHaveUppercase: "'{PropertyName}' phải có ít nhất một chữ cái in hoa.",
            Language.code.notEmpty: "'{PropertyName}' không được để trống.",
            Language.code.notEqualTo: "'{PropertyName}' không được bằng '{ComparisonValue}'.",
            Language.code.range: "'{PropertyName}' phải nằm trong khoảng từ {From} đến {To}. Giá trị bạn nhập là {PropertyValue}.",
            Language.code.validEmail: "'{PropertyName}' không phải là địa chỉ email hợp lệ.",
            Language.code.greaterThanOrEqualToDateTime: "'{PropertyName}' phải lớn hơn hoặc bằng ngày '{ComparisonValue}'.",
            Language.code.greaterThanDatetime: "'{PropertyName}' phải lớn hơn ngày '{ComparisonValue}'.",
            Language.code.lessThanOrEqualToDateTime: "'{PropertyName}' phải nhỏ hơn hoặc bằng ngày '{ComparisonValue}'.",
            Language.code.lessThanDateTime: "'{PropertyName}' phải nhỏ hơn ngày '{ComparisonValue}'.",
            Language.code.inclusiveBetweenDatetime:
                "'{PropertyName}' phải lớn hơn hoặc bằng ngày '{StartValue}' và nhỏ hơn hoặc bằng ngày '{EndValue}'.",
            Language.code.exclusiveBetweenDatetime: "'{PropertyName}' phải lớn hơn ngày '{StartValue}' và nhỏ hơn ngày '{EndValue}'."
          },
        );
}
