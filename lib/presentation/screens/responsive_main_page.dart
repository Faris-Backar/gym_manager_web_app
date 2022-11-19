import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';

class ResponsiveMainPage extends StatefulWidget {
  final Widget child;
  const ResponsiveMainPage({Key? key, required this.child}) : super(key: key);

  @override
  State<ResponsiveMainPage> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<ResponsiveMainPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleResorces.bgColor,
      key: _key,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: DrawerWidget(),
              ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    scrollbarTheme: const ScrollbarThemeData(),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (!Responsive.isDesktop(context))
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: Responsive.isTablet(context)
                                      ? 12.sp
                                      : 20.sp,
                                ),
                                onPressed: () {
                                  _key.currentState!.openDrawer();
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'PowerHouse',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Responsive.isTablet(context)
                                      ? 10.sp
                                      : 16.sp,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 3.h,
                        ),
                        widget.child
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
