import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';

class MembershipScreen extends StatefulWidget {
  static const routeName = '/memberShpScreen';
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
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
