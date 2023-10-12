import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../helper/colors.dart';



class TextfieldCustom extends StatelessWidget {
  String? label;
  String? hinttext;
  TextEditingController? TextController;
  TextInputType? Keyboardtype;
  bool? obscureText;
  IconData? sufficon;
  Color? iconcolor;
  bool ? Iconyn;
  VoidCallback? onPress;
  int? maxLines;
  double bottomPadding ;
  double topPadding ;
  Color borderColor;
  Color fillColor;
  bool avatarOnIcon;


  TextfieldCustom({Key? key,required this.label, required this.hinttext,required this.TextController,required this.Keyboardtype, this.obscureText =false,
    this.sufficon,
    this.Iconyn = false,
    this.onPress,
    this.iconcolor,
    this.maxLines,
    this.bottomPadding = 1,
    this.topPadding =1,
   this.borderColor=AppColors.primaryColor,
    this.fillColor=AppColors.whiteColor,
    this.avatarOnIcon = false
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: topPadding.h , bottom: bottomPadding.h ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:1.h),
            child: Text(label ?? 'Enter Text', style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 12),),
          ),
          SizedBox(height:.5.h,),
          Container(
            decoration: BoxDecoration(


            ),
            child: SizedBox(
              height: 32,
              child: TextFormField(
                obscureText: obscureText ?? false,
                controller: TextController ,
                keyboardType: Keyboardtype,
                maxLines: maxLines ?? 1,
                  style: TextStyle(fontSize: 10 ),
                decoration: InputDecoration(
                  hintText: hinttext,
                  fillColor: fillColor,
               contentPadding:   EdgeInsets.symmetric( horizontal: 2.h),
                  suffixIcon :avatarOnIcon == true ?null
                  : Iconyn == true ? IconButton(
                    onPressed: onPress,

                    icon: Icon(sufficon,color: iconcolor,size: 2.h,),
                  ) : null,
                  hintStyle: TextStyle(fontSize: 10 , color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor ,width: 2),
                      borderRadius: BorderRadius.circular(20)


                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor ,width: 2),
                      borderRadius: BorderRadius.circular(20)

                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
