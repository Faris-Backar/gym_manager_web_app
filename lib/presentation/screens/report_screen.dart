import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';

class ReportScreen extends StatefulWidget {
  static const routeName = '/ReportScreen';
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const DrawerWidget(),
      body: Row(
        children: [
          ScreenTypeLayout(
            mobile: const SizedBox.shrink(),
            desktop: SizedBox(
              width: 18.w,
              child: const DrawerWidget(),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  ScreenTypeLayout(
                    mobile: IconButton(
                      icon: const Icon(
                        Icons.menu,
                      ),
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                    ),
                    tablet: IconButton(
                      icon: const Icon(
                        Icons.menu,
                      ),
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                    ),
                    desktop: const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
