import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/theme/theme_text.dart';
import 'package:gym_manager_web_app/presentation/widgets/drawer_widget.dart';
import 'package:gym_manager_web_app/util/functions.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleResorces.bgColor,
      key: _key,
      drawer: const DrawerWidget(),
      body: Row(
        children: [
          // Row(
          //   children: [
          //     ScreenTypeLayout(
          //       mobile: const SizedBox.shrink(),
          //       desktop: SizedBox(
          //         width: 18.w,
          //         child: const DrawerWidget(),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         ScreenTypeLayout(
          //           mobile: IconButton(
          //             icon: const Icon(
          //               Icons.menu,
          //             ),
          //             onPressed: () {
          //               _key.currentState!.openDrawer();
          //             },
          //           ),
          //           tablet: IconButton(
          //             icon: const Icon(
          //               Icons.menu,
          //             ),
          //             onPressed: () {
          //               _key.currentState!.openDrawer();
          //             },
          //           ),
          //           desktop: const SizedBox.shrink(),
          //         ),
          //       ],
          //     ),
          //     // GridView.builder(
          //     //     shrinkWrap: true,
          //     //     gridDelegate:
          //     //         const SliverGridDelegateWithMaxCrossAxisExtent(
          //     //             maxCrossAxisExtent: 200,
          //     //             childAspectRatio: 3 / 2,
          //     //             crossAxisSpacing: 20,
          //     //             mainAxisSpacing: 20),
          //     //     itemCount: 4,
          //     //     itemBuilder: (BuildContext ctx, index) {
          //     //       return Container(
          //     //         alignment: Alignment.center,
          //     //         decoration: BoxDecoration(
          //     //             color: Colors.amber,
          //     //             borderRadius: BorderRadius.circular(15)),
          //     //         child: Container(
          //     //           color: Colors.blue,
          //     //         ),
          //     //       );
          //     //     }),
          //     // Container(
          //     //   height: 300,
          //     //   width: double.infinity,
          //     //   color: Colors.grey,
          //     // ),
          //   ],
          // ),
          // if (!Responsive.isDesktop(context))
          //   IconButton(
          //     icon: const Icon(
          //       Icons.menu,
          //     ),
          //     onPressed: () {
          //       _key.currentState!.openDrawer();
          //     },
          //   ),
          //   if(reponsive)
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
                              icon: const Icon(
                                Icons.menu,
                              ),
                              onPressed: () {
                                _key.currentState!.openDrawer();
                              },
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'PowerHouse',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                !Responsive.isDesktop(context) ? 2 : 4,
                            childAspectRatio:
                                !Responsive.isTablet(context) ? 3 / 2 : 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: 4,
                          itemBuilder: (BuildContext ctx, index) {
                            return Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: StyleResorces.secondaryColor,
                              elevation: 2.0,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(
                                  getHeaderButtonPadding(context),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Total Members',
                                      textAlign: TextAlign.center,
                                      style: CustomeTextTheme.buttonHeaderText(
                                          context),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('16',
                                          style: CustomeTextTheme
                                              .buttonHeaderContentText(
                                                  context)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: StyleResorces.secondaryColor),
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
}
