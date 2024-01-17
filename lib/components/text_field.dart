import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

customTextField({
  required FocusNode focusNode,
  required TextEditingController controller,
  String? hintText,
  int? fontSize,
  FontWeight? fontWeight,
  TextInputType? keyboardType,
  IconData? icon,
  Widget? suffixIcon,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return CupertinoTextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily:
            const String.fromEnvironment('fontFamily', defaultValue: 'Inter'),
        fontSize: fontSize != null ? fontSize.toDouble() : 14.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: focusNode.hasFocus
            ? const Color(0xFF429690)
            : const Color(0xFF666666),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: focusNode.hasFocus
              ? const Color(0xFF429690)
              : const Color(0xFFDDDDDD),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      placeholder: hintText,
      placeholderStyle: TextStyle(
        fontFamily:
            const String.fromEnvironment('fontFamily', defaultValue: 'Inter'),
        fontSize: fontSize != null ? fontSize.toDouble() : 14.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: const Color(0xFF666666),
      ),
      prefix: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: icon != null
            ? Icon(
                icon,
                color: focusNode.hasFocus
                    ? const Color(0xFF429690)
                    : const Color(0xFF666666),
              )
            : null,
      ),
      suffix: suffixIcon,
    );
  } else {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily:
            const String.fromEnvironment('fontFamily', defaultValue: 'Inter'),
        fontSize: fontSize != null ? fontSize.toDouble() : 14.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: focusNode.hasFocus
            ? const Color(0xFF429690)
            : const Color(0xFF666666),
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0), // Add this line
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF429690), width: 1.4),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 1.0),
        ),
        hintText: hintText,
        prefixIcon: Icon(icon),
        prefixIconColor: focusNode.hasFocus
            ? const Color(0xFF429690)
            : const Color(0xFF666666),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
