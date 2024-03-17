import 'package:flutter/material.dart';
import 'package:route_courses_app/style/app_colors.dart';

typedef validation = String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  String label;
  Widget? suffixIcon;
  TextEditingController controller;
  bool isObsecuredText;
  validation validator;
  TextInputType keyboardType;

  CustomTextField({super.key,
    required this.label,
    this.suffixIcon,
    required this.controller,
    this.isObsecuredText = false,
    this.validator,
    required this.keyboardType

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
          )
        )
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w200
      ),
      obscuringCharacter: '*',
      controller: controller,
      obscureText: isObsecuredText,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
