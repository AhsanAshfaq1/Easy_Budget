import 'package:flutter/cupertino.dart';

Text customText({
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required Color textColor,
}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily:
          const String.fromEnvironment('fontFamily', defaultValue: 'Inter'),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
    ),
  );
}
