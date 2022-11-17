import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:sizer/sizer.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/domain/model/auth_model.dart';
import 'package:gym_manager_web_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:gym_manager_web_app/presentation/screens/home_screen.dart';
import 'package:gym_manager_web_app/presentation/widgets/form_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log('1sp=> ${1.sp}, 1h=>${1.h} 1w=>${1.w}');
    return Scaffold(
        backgroundColor: StyleResorces.scaffoldBackgroundColor,
        body: Responsive.isDesktop(context)
            ? Center(
                child: loginCard(context),
              )
            : loginCard(context));
  }

  Card loginCard(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        height: Responsive.isDesktop(context) ? 80.h : 100.h,
        width: Responsive.isDesktop(context) ? 40.w : 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: StyleResorces.accentColor,
        ),
        padding:
            Responsive.isDesktop(context) ? null : const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 18.h,
              width: 18.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Power House',
              style: TextStyle(
                color: StyleResorces.shadedText,
                fontSize: Responsive.isDesktop(context) ? 4.40.sp : 8.sp,
              ),
            ),
            SizedBox(
              height: Responsive.isDesktop(context) ? 2.h : 5.h,
            ),
            Text(
              'Login Gym Manager',
              style: TextStyle(
                color: StyleResorces.scaffoldBackgroundColor,
                fontSize: Responsive.isDesktop(context) ? 5.29.sp : 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: StyleResorces.accentColor,
                    ),
                  );
                }
                if (state is AuthSucess) {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
              child: SizedBox(
                width: Responsive.isDesktop(context) ? 30.w : double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: StyleResorces.shadedText,
                          fontSize: Responsive.isDesktop(context) ? 4.sp : 8.sp,
                        ),
                      ),
                      FormTextFieldWidget(
                        controller: usernameController,
                        isPasswordField: false,
                        hintText: 'Email Address',
                        validatorFunction: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid email Address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: StyleResorces.shadedText,
                          fontSize: Responsive.isDesktop(context) ? 4.sp : 8.sp,
                        ),
                      ),
                      FormTextFieldWidget(
                        isPasswordVisible: _isPasswordVisible,
                        controller: passwordController,
                        isPasswordField: true,
                        hintText: 'Password',
                        suffixWidget: IconButton(
                          icon: _isPasswordVisible
                              ? const Icon(
                                  Icons.visibility_off_rounded,
                                  color: StyleResorces.shadedText,
                                )
                              : const Icon(
                                  Icons.visibility_rounded,
                                  color: StyleResorces.shadedText,
                                ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        validatorFunction: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const CircularProgressIndicator();
                          }
                          return Material(
                            color: StyleResorces.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5.0,
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  final credentials = AuthModel(
                                      username: usernameController.text,
                                      password: passwordController.text);
                                  BlocProvider.of<AuthBloc>(context).add(
                                    LoginEvent(credentials: credentials),
                                  );
                                }
                              },
                              child: Container(
                                height:
                                    Responsive.isDesktop(context) ? 10.sp : 8.h,
                                width: Responsive.isDesktop(context)
                                    ? 30.w
                                    : double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
