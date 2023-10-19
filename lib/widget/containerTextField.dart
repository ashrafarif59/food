import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../helper/colors.dart';
import '../helper/image.dart';



class TextFieldContainer extends StatelessWidget {
  String? label;
  String? hinttext;
  TextEditingController? TextController;
  TextInputType? Keyboardtype;
  Color? borderColor;



  TextFieldContainer({Key? key,required this.label, required this.hinttext,required this.TextController,
    required this.Keyboardtype,
    this.borderColor = Colors.transparent
    // , this.obscureText =false,
    // this.sufficon,
    // this.Iconyn = false,
    // this.onPress,
    // this.iconcolor,
    // this.maxLines,
    // this.bottomPadding = 1,
    // this.topPadding =1,
    // this.borderColor=AppColors.primaryColor,
    // this.fillColor=AppColors.whiteColor,
    // this.avatarOnIcon = false,
    // this.Imagechild,
    // this.prefixicon,wwwwwwwwwwwwwwwwww
    // this.preIconColor,
    // this.preIconyn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      //  SvgPicture.asset(icononsearch,fit: BoxFit.scaleDown,);
      Padding(
        padding:  EdgeInsets.only(top: 2.h, left: 3.h,right: 3.h),
        child: Material(
          elevation: 10,
          shadowColor: AppColors.grayshade.withOpacity(.5),
          borderRadius :BorderRadius.circular(10),
          //color: Colors.blue,
          child: TextFormField(
              controller: TextController,


              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: .5.h),
                  fillColor: Colors.white,
                  constraints: BoxConstraints(
                      maxHeight: 5.h

                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white ,width: 2,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),

                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white ,width: 2,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),


                  ),

                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  suffixIcon: Padding(
                    padding:  EdgeInsets.only(right: 1.h),
                    child: Container(
                        margin: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryColor,
                        ),



                        child: Image.asset(icononsearch,fit: BoxFit.scaleDown,)),
                  )
              )
          ),
        ),
      );


  }
}