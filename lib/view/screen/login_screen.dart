import 'package:flutter/material.dart';
import 'package:food/widget/CustomTextField.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';
import '../../widget/backgroudleave.dart';
import '../../widget/button.dart';
import '../../widget/textfield.dart';
import 'AccountRegister.dart';
import 'forgot_password.dart';
import 'navigator.dart';
//import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double textHeight =4.0;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: bgleaveWidget(
            background: leavebg,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 10.h,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 4.h,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 5.h,
                                )),
                            Positioned(
                              left: 8.h,
                              top: 3.h,
                              child: Text(
                                'Welcome Back',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 7.h, right: 10.w, top: 2.h),
                        child: Text(
                          'I am very happy to see you. You can continue to login for latest recipe',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.h, vertical: 3.h),
                        child: Form(
                          key: formkey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 4.h,
                                  child: GPATextField(
                                      validator:(String? val) {
                                        if (val!.isEmpty)
                                        {
                                          return null;
                                        }
                                      }
                                  )
                              ),
                              TextfieldCustom(
                                  label: 'Email',
                                  hinttext: 'abc@gmail.com ',
                                  TextController: emailController,
                                  Keyboardtype: TextInputType.emailAddress,
                                   textheight: textHeight,
                                  validator:(String? val) {
                                    if (val!.isEmpty)
                                    {
                                    return null;
                                    }
                                    }
                                  ),
                              TextfieldCustom(
                                  label: 'Password',
                                  hinttext: '*********** ',
                                  TextController: passwordController,
                                  Keyboardtype: TextInputType.text,
                                  Iconyn: true,
                                  sufficon: Icons.visibility_off_outlined,
                                  obscureText: true,
                                  bottomPadding: .5),
                              //SizedBox(height: .0001.h ,),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ));
                                    },
                                    child: Text(
                                      'Forget Password  ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              SizedBox(
                                height: 5.h,
                              ),
                              PrimaryButton(
                                  Titletype: titleType.OnlyTitle,
                                  title: 'LOGIN',
                                  iconName: Icons.arrow_forward,
                                  width: 40.w,
                                  height: 4.1.h,
                                  onPress: () {
                                    if (formkey!.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => navigator(),
                                          ));
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => accountRegister(),
                          ));
                    },
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          TextSpan(
                              text: 'Don’t have an account',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          WidgetSpan(
                            child: Icon(
                              Icons.vertical_align_bottom,
                              size: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' SIGNUP',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
