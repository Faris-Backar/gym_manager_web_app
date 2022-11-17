import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/presentation/screens/responsive_main_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';

class FeesPaymentScreen extends StatefulWidget {
  static const routeName = '/feesPaymentScreen';
  const FeesPaymentScreen({Key? key}) : super(key: key);

  @override
  State<FeesPaymentScreen> createState() => _FeesPaymentScreenState();
}

class _FeesPaymentScreenState extends State<FeesPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveMainPage(
          child: Column(
        children: [],
      )),
    );
  }
}
