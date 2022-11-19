import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/responsive_main_page.dart';
import 'package:gym_manager_web_app/presentation/widgets/form_text_field_widget.dart';
import 'package:gym_manager_web_app/util/functions.dart';
import 'package:sizer/sizer.dart';

class FeesPaymentScreen extends StatefulWidget {
  static const routeName = '/feesPaymentScreen';
  const FeesPaymentScreen({Key? key}) : super(key: key);

  @override
  State<FeesPaymentScreen> createState() => _FeesPaymentScreenState();
}

class _FeesPaymentScreenState extends State<FeesPaymentScreen> {
  final _searchUserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveMainPage(
        child: Column(
          children: [
            Text(
              'Pay Fees',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: getResponsiveFontsSize(
                      desktopSize: 08.sp,
                      tabletSize: 12.sp,
                      mobileSize: 14.sp,
                      context: context,
                    ),
                  ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60.w,
                  child: FormTextFieldWidget(
                    isPasswordField: false,
                    controller: _searchUserController,
                    borderColor: StyleResorces.accentColor,
                    hintText: 'Search Members',
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  color: StyleResorces.primaryColor,
                  child: Container(
                    height: Responsive.isDesktop(context) ? 8.h : 6.h,
                    width: 25.w,
                    alignment: Alignment.center,
                    child: Text(
                      'Search',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: getResponsiveFontsSize(
                              desktopSize: 8.sp,
                              tabletSize: 8.sp,
                              mobileSize: 14.sp,
                              context: context,
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
