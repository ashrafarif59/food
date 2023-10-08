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


  TextfieldCustom({Key? key,required this.label, required this.hinttext,required this.TextController,required this.Keyboardtype, this.obscureText =false,
    this.sufficon,
    this.Iconyn = false,
    this.onPress,
    this.iconcolor,
    this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:2.h),
            child: Text(label ?? 'Enter Text', style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 12),),
          ),
          SizedBox(height:.5.h,),
          Container(
            decoration: BoxDecoration(


            ),
            child: SizedBox(
              height: 38,
              child: TextFormField(
                obscureText: obscureText ?? false,
                controller: TextController ,
                keyboardType: Keyboardtype,
                maxLines: maxLines ?? 1,

                decoration: InputDecoration(
                  hintText: hinttext,

               contentPadding:   EdgeInsets.symmetric( horizontal: 3.h),
                  suffixIcon :Iconyn == true ? IconButton(
                    onPressed: onPress,

                    icon: Icon(sufficon,color: iconcolor,),) : null,
                  hintStyle: TextStyle(fontSize: 10 , color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor ,width: 2),
                      borderRadius: BorderRadius.circular(20)


                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor ,width: 2),
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
