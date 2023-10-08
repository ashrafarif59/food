import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/widget/backgroudleave.dart';
import 'package:sizer/sizer.dart';

import '../../helper/image.dart';
import '../../widget/button.dart';
import '../../widget/textfield.dart';
import 'login_screen.dart';

class accountRegister extends StatefulWidget {
  const accountRegister({Key? key}) : super(key: key);

  @override
  State<accountRegister> createState() => _accountRegisterState();
}

class _accountRegisterState extends State<accountRegister> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cPasswordController = TextEditingController();
    return Scaffold(
       appBar: AppBar(
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
          child: bgleaveWidget(background: leavebg,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                  width: 100.w,
                  height: 10.h,

                  child: Stack(
                    children: [
                      Positioned(
                          left:4.h,
                          child: CircleAvatar(backgroundColor: AppColors.primaryColor,radius: 5.h,)),
                      Positioned(
                        left: 8.h,
                        top: 3.h,
                        child: Text('Create a new Account', style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,fontSize: 21),),
                      ),


                    ],
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 9.h,vertical: 1.h),
                    child: Text('Create an account so you can see  our latest Racipes',
                      textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey),),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.h,vertical: 2.h),
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        TextfieldCustom(
                            label: 'Name',
                            hinttext: 'ABDUL HANNAN ',
                            TextController: nameController,
                            Keyboardtype: TextInputType.text),

                    TextfieldCustom(
                        label: 'Email',
                        hinttext: 'abc@gmail.com ',
                        TextController: emailController,
                        Keyboardtype: TextInputType.emailAddress),
                    TextfieldCustom(
                        label: 'Password',
                        hinttext: '*********** ',
                        TextController: passwordController,
                        Keyboardtype: TextInputType.text,
                      Iconyn:true,
                        sufficon : Icons.visibility_off_outlined,
                         obscureText: true,
                    ),
                    TextfieldCustom(
                        label: 'Confirm Password',
                        hinttext: 'Confirm Password ',
                        TextController: cPasswordController,
                         Iconyn:true,
                        sufficon : Icons.visibility_off_sharp,
                        Keyboardtype: TextInputType.text,
                        obscureText: true,),
                    SizedBox(height: 5.h ,),
                    PrimaryButton(Titletype:   titleType.OnlyTitle,
                        title: 'Get Started',
                        iconName: Icons.arrow_forward,
                        width: 70.w,
                        height: 4.5.h,
                        onPress: (){}
                    ),
                    SizedBox(height: 5.h ,),
                    PrimaryButton(Titletype:   titleType.ImageAndTitle,
                        title: 'Signup with Google',
                        iconName: Icons.arrow_forward,
                        image: googlelogos1,
                        imageWidth: 3.h,
                        imageHeight: 50.sp,
                        imagespace :25,
                        width: 70 .w,
                        height: 4.5.h,
                        onPress: (){}
                    ),
                    SizedBox(height: 9.h ,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              children: [
                                TextSpan(
                                    text: 'Already have an account',
                                    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)),
                                WidgetSpan(
                                  child: Icon(Icons.vertical_align_bottom, size: 12,color: AppColors.primaryColor,),
                                ),
                                TextSpan(
                                    text:
                                    ' LOGIN',
                                    style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}

