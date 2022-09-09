import 'package:flutter/cupertino.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:sizer/sizer.dart';

double getHeaderButtonPadding(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return 1.w;
  } else if (Responsive.isMobile(context)) {
    return 2.w;
  } else {
    return 4.w;
  }
}

double getHeaderFontSize(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return 5.sp;
  } else if (Responsive.isMobile(context)) {
    return 10.sp;
  } else {
    return 8.sp;
  }
}

double getHeaderContentFontSize(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return 9.sp;
  } else if (Responsive.isMobile(context)) {
    return 20.sp;
  } else {
    return 17.sp;
  }
}
