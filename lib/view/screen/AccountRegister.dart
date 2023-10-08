import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/widget/backgroudleave.dart';
import 'package:sizer/sizer.dart';

import '../../helper/image.dart';
import '../../widget/button.dart';
import '../../widget/textfield.dart';

class accountRegister extends StatefulWidget {
  const accountRegister({Key? key}) : super(key: key);

  @override
  State<accountRegister> createState() => _accountRegisterState();
}

class _accountRegisterState extends State<accountRegister> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
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
        body: bgleaveWidget(background: leavebg,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                width: 100.w,
                height: 18.w,

                child: Stack(
                  children: [
                    Positioned(
                        left:4.h,
                        child: CircleAvatar(backgroundColor: AppColors.primaryColor,radius: 4.h,)),
                    Positioned(
                      left: 7.h,
                      top: 1.9.h,
                      child: Text('Create a new Account', style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,fontSize: 21),),
                    ),


                  ],
                ),
              ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 1.h),
                  child: Text('Create an account so you can see  our latest Racipes',
                    textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h),
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
                      TextController: nameController,
                      Keyboardtype: TextInputType.emailAddress),
                  TextfieldCustom(
                      label: 'Password',
                      hinttext: '*********** ',
                      TextController: nameController,
                      Keyboardtype: TextInputType.text,
                    Iconyn:true,
                      sufficon : Icons.visibility_off_outlined,
                       obscureText: true,
                  ),
                  TextfieldCustom(
                      label: 'Confirm Password',
                      hinttext: 'Confirm Password ',
                      TextController: nameController,
                       Iconyn:true,
                      sufficon : Icons.visibility_off_sharp,
                      Keyboardtype: TextInputType.text,
                      obscureText: true,),
                  SizedBox(height: 15.sp ,),
                  PrimaryButton(Titletype:   titleType.OnlyTitle,
                      title: 'Get Started',
                      iconName: Icons.arrow_forward,
                      onPress: (){}
                  ),
                  SizedBox(height: 15.sp ,),
                  PrimaryButton(Titletype:   titleType.ImageAndTitle,
                      title: 'Get Started',
                      iconName: Icons.arrow_forward,
                      image: googlelogos1,
                      onPress: (){}
                  ),
                  SizedBox(height: 15.sp ,),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                                text: 'Already have an account',
                                style: TextStyle(color: Colors.blue)),
                            WidgetSpan(
                              child: Icon(Icons.vertical_align_bottom, size: 12,color: AppColors.primaryColor,),
                            ),
                            TextSpan(
                                text:
                                ' LOGIN',
                                style: TextStyle(color: AppColors.primaryColor)
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
