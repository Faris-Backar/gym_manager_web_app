import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(const GymManagerWebApp());
}

class GymManagerWebApp extends StatelessWidget {
  const GymManagerWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Poppins",
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: StyleResorces.primaryColor,
            )),
      );
    });
  }
}
