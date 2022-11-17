import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/add_member_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class MembershipScreen extends StatefulWidget {
  static const routeName = '/memberShpScreen';
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final occupationController = TextEditingController();
  // final
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline2;
    final headerTextTheme = Theme.of(context).textTheme.headline6;
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: StyleResorces.bgColor,
      key: _key,
      drawer: const DrawerWidget(),
      body: Row(
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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 20.sp,
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
                                  color: Colors.white, fontSize: 16.sp),
                            )
                          ],
                        ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Members',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isDesktop ? 08.sp : 16.sp,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AddMemberScreen.routeName),
                            child: const Text('Add Member +'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: StyleResorces.secondaryColor,
                        ),
                        child: StickyHeader(
                          header: Material(
                            elevation: 5.0,
                            color: StyleResorces.secondaryColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              height: 10.h,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: stickyHeaderWidget(headerTextTheme),
                            ),
                          ),
                          content: Container(
                            height: 66.h,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return detailsList(textTheme,
                                    age: "24",
                                    memberShipType: "Full Club",
                                    name: "Faris",
                                    phone: "7736563740",
                                    regNo: "001");
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row stickyHeaderWidget(TextStyle? headerTextTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Reg.No',
            style: headerTextTheme,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 2,
          child:
              Text('Name', style: headerTextTheme, textAlign: TextAlign.start),
        ),
        Expanded(
          flex: 2,
          child: Text('Phone Number',
              style: headerTextTheme, textAlign: TextAlign.start),
        ),
        Expanded(
          flex: 2,
          child: Text('Membership type',
              style: headerTextTheme, textAlign: TextAlign.start),
        ),
        Expanded(
          flex: 1,
          child:
              Text('Age', style: headerTextTheme, textAlign: TextAlign.start),
        ),
      ],
    );
  }

  Row detailsList(
    TextStyle? textTheme, {
    required String regNo,
    required String name,
    required String phone,
    required String memberShipType,
    required String age,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            regNo,
            style: textTheme,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            name,
            style: textTheme,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            phone,
            style: textTheme,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            memberShipType,
            style: textTheme,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            age,
            style: textTheme,
          ),
        ),
      ],
    );
  }
}
