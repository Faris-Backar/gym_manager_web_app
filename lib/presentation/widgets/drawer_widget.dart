import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/fees_payment_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/fees_pending_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/home_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/membership_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/report_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var drawerList = [
      {
        'name': 'Home',
        'icon': 'assets/svgs/home.svg',
        'ontap': HomeScreen.routeName,
      },
      {
        'name': 'Fees Pending',
        'icon': 'assets/svgs/due-date.svg',
        'ontap': FeesPendingScreen.routeName
      },
      {
        'name': 'MemberShip',
        'icon': 'assets/svgs/member-card.svg',
        'ontap': MembershipScreen.routeName
      },
      {
        'name': 'Pay fees',
        'icon': 'assets/svgs/rupee.svg',
        'ontap': FeesPaymentScreen.routeName
      },
      {
        'name': 'Report',
        'icon': 'assets/svgs/report.svg',
        'ontap': ReportScreen.routeName,
      },
    ];
    return Drawer(
      elevation: 5.0,
      child: Container(
        color: StyleResorces.secondaryColor,
        child: Column(
          children: [
            DrawerHeader(
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
                color: StyleResorces.accentColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawerList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  drawerList[index]['name'].toString(),
                  style: const TextStyle(
                    color: StyleResorces.accentColor,
                  ),
                ),
                leading: SvgPicture.asset(
                  drawerList[index]['icon'].toString(),
                  color: StyleResorces.accentColor,
                  height: 3.5.h,
                  width: 3.5.h,
                ),
                onTap: () {
                  log(drawerList[index]['ontap'] as String);
                  Navigator.of(context)
                      .pushNamed(drawerList[index]['ontap'] as String);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
