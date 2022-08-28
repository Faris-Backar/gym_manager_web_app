import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/home_screen.dart';
import 'package:gym_manager_web_app/presentation/widgets/form_text_field_widget.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    log('1sp=> ${1.sp}, 1h=>${1.h} 1w=>${1.w}');
    return Scaffold(
      backgroundColor: StyleResorces.scaffoldBackgroundColor,
      body: Center(
        child: Card(
          elevation: 5.0,
          child: Container(
              height: 80.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: StyleResorces.accentColor,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 10.h,
                    backgroundColor: StyleResorces.accentColor,
                    foregroundImage: const AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                  Text(
                    'Power House',
                    style: TextStyle(
                      color: StyleResorces.shadedText,
                      fontSize: 4.40.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Login Gym Manager',
                    style: TextStyle(
                      color: StyleResorces.scaffoldBackgroundColor,
                      fontSize: 5.29.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 30.w,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: StyleResorces.shadedText,
                              fontSize: 4.sp,
                            ),
                          ),
                          FormTextFieldWidget(
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
                              fontSize: 4.sp,
                            ),
                          ),
                          FormTextFieldWidget(
                            isPasswordField: true,
                            hintText: 'Password',
                            suffixWidget: IconButton(
                              icon: _isPasswordVisible
                                  ? const Icon(
                                      Icons.visibility_rounded,
                                      color: StyleResorces.shadedText,
                                    )
                                  : const Icon(
                                      Icons.visibility_off_rounded,
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
                          Material(
                            color: StyleResorces.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5.0,
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 10.sp,
                                width: 30.w,
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
