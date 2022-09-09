import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/util/functions.dart';

class CustomeTextTheme {
  const CustomeTextTheme._();

  static TextStyle buttonHeaderText(BuildContext context) {
    return TextStyle(
      color: StyleResorces.accentColor,
      fontWeight: FontWeight.w600,
      fontSize: getHeaderFontSize(context),
    );
  }

  static TextStyle buttonHeaderContentText(BuildContext context) {
    return TextStyle(
      color: StyleResorces.accentColor,
      fontWeight: FontWeight.w600,
      fontSize: getHeaderContentFontSize(context),
    );
  }
}
