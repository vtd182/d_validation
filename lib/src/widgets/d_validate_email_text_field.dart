import 'package:d_validation/src/widgets/string_validator.dart';
import 'package:flutter/material.dart';

class DValidateEmailTextField extends StatefulWidget {
  final String label;
  final String keyField;
  final TextEditingController controller;
  final Function(String) onChanged;

  const DValidateEmailTextField({
    super.key,
    required this.label,
    required this.keyField,
    required this.controller,
    required this.onChanged,
  });

  @override
  _DValidateEmailTextFieldState createState() => _DValidateEmailTextFieldState();
}

class _DValidateEmailTextFieldState extends State<DValidateEmailTextField> {
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          onChanged: (value) {
            final res = StringValidator().validate(value);
            setState(() {
              if (res.isValid || value.isEmpty) {
                errorMessage = null;
              } else {
                errorMessage = res.exceptions.first.message;
              }
            });
          },
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: errorMessage,
          ),
        ),
      ],
    );
  }
}
