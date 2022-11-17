import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_manager_web_app/presentation/screens/add_member_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/fees_payment_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/fees_pending_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/home_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/login_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/membership_screen.dart';
import 'package:gym_manager_web_app/presentation/screens/report_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

late SharedPreferences prefs;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDFL4K4etvVT36_yeAoNM5mTwYhfT_AtQQ",
        appId: "1:542318597202:web:dd653f077ce405f5f5fb8b",
        messagingSenderId: "542318597202",
        projectId: "web-app-8f3c3"),
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const GymManagerWebApp());
}

class GymManagerWebApp extends StatelessWidget {
  const GymManagerWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              home: const LoginScreen(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Poppins",
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: StyleResorces.primaryColor,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                textTheme: TextTheme(
                  headline6: TextStyle(
                      color: Colors.white,
                      fontSize: (!Responsive.isDesktop(context))
                          ? (Responsive.isMobile(context))
                              ? 6.sp
                              : 15.sp
                          : 5.sp),
                  headline2: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: (!Responsive.isDesktop(context)) ? 4.sp : 06.sp,
                  ),
                ),
              ),
              routes: {
                LoginScreen.routeName: (context) => const LoginScreen(),
                HomeScreen.routeName: (context) => const HomeScreen(),
                FeesPendingScreen.routeName: (context) =>
                    const FeesPendingScreen(),
                FeesPaymentScreen.routeName: (context) =>
                    const FeesPaymentScreen(),
                MembershipScreen.routeName: (context) =>
                    const MembershipScreen(),
                ReportScreen.routeName: (context) => const ReportScreen(),
                AddMemberScreen.routeName: (context) => const AddMemberScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
