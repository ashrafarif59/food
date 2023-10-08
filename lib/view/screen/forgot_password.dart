import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

import '../../widget/button.dart';
import '../../widget/textfield.dart';
import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text('Forget Password',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
           centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,size: 15,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          automaticallyImplyLeading: false ,


        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 9.h,vertical: 1.h),
            child: Column(
              children: [
                SizedBox(height: 1.5.h,),
                Container(
                  width: 100.w,
                  height: 30.h,
                   child: Image(image: AssetImage(forgotpassword))

                ),
                SizedBox(height: 8.h,),
                Text('Select email should we use to reset password',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey),),
                SizedBox(height: 6.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 3.h,right: 3.h),
                  child: Row(
                    children: [
                      Text('abc@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      CircleAvatar(
                         radius: 8,
                        backgroundColor: AppColors.primaryColor,
                        child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(radius: 5,backgroundColor: AppColors.graywhite,)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                PrimaryButton(Titletype:   titleType.OnlyTitle,
                    title: 'SEND',
                    width: 40.w,
                    height: 4.5.h,
                    onPress: (){}
                ),

              ],
            ),
          ),
        )
    );
  }
}
