import 'package:flutter/material.dart';
import 'package:gym_manager_web_app/core/resources/responsive.dart';
import 'package:gym_manager_web_app/core/resources/style_resources.dart';
import 'package:gym_manager_web_app/presentation/screens/responsive_main_page.dart';
import 'package:gym_manager_web_app/presentation/widgets/form_text_field_widget.dart';
import 'package:sizer/sizer.dart';

class AddMemberScreen extends StatefulWidget {
  static const routeName = '/add-member';
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _registerController = TextEditingController();
  final _phoneController = TextEditingController();
  final _namecontroller = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();
  final _addressController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _registerController.dispose();
    _phoneController.dispose();
    _namecontroller.dispose();
    _ageController.dispose();
    _placeController.dispose();
    _addressController.dispose();
    _weightController.dispose();
    _heightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveMainPage(
        child: Form(
      child: Column(
        children: [
          Text(
            'Add Member',
            style: (Responsive.isDesktop(context))
                ? Theme.of(context).textTheme.headline6
                : TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: StyleResorces.accentColor,
                  ),
          ),
          SizedBox(
            height: 2.h,
          ),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _registerController,
            hintText: 'Register Number',
            borderColor: Colors.white,
            textColor: StyleResorces.accentColor,
            validatorFunction: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid register number';
              }
              return null;
            },
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _namecontroller,
            hintText: 'Name',
            borderColor: Colors.white,
            textColor: StyleResorces.accentColor,
            validatorFunction: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid Name';
              }
              return null;
            },
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _phoneController,
            hintText: 'Phone Number',
            borderColor: Colors.white,
            textColor: StyleResorces.accentColor,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _ageController,
            hintText: 'Age',
            textInputType: TextInputType.number,
            borderColor: Colors.white,
            textColor: StyleResorces.accentColor,
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _heightController,
            hintText: 'Height',
            borderColor: Colors.white,
            textInputType: TextInputType.number,
            textColor: StyleResorces.accentColor,
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _weightController,
            hintText: 'Weight',
            borderColor: Colors.white,
            textInputType: TextInputType.number,
            textColor: StyleResorces.accentColor,
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _placeController,
            hintText: 'Place',
            borderColor: Colors.white,
            textInputType: TextInputType.number,
            textColor: StyleResorces.accentColor,
          ),
          SizedBox(height: 2.h),
          FormTextFieldWidget(
            isPasswordField: false,
            controller: _addressController,
            hintText: 'Address',
            borderColor: Colors.white,
            textInputType: TextInputType.number,
            textColor: StyleResorces.accentColor,
          ),
          SizedBox(height: 5.h),
          Material(
            elevation: 5.0,
            color: StyleResorces.primaryColor,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              alignment: Alignment.center,
              height: 7.h,
              width: 100.w,
              child: const Text(
                'Submit',
                style: TextStyle(color: StyleResorces.accentColor),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
