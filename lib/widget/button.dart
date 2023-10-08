import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../helper/colors.dart';
import '../helper/image.dart';
enum titleType {OnlyIcon,OnlyTitle,ImageAndTitle}

class PrimaryButton extends StatelessWidget {

  titleType Titletype;
  String title;
  VoidCallback onPress;
  Color  backgroundColor;
  IconData iconName;
  String image;
  // Color textColor;

  //
  // Color iconNameColor;
  // String imageLeft;
  // bool iconYN;
  // double bordercircular;
  // double height;
  // double fontsize;
  PrimaryButton({Key? key,
    this.title = '',
    required this.onPress,
    required this.Titletype ,
    this.backgroundColor = AppColors.primaryColor,
    this.iconName =Icons.arrow_circle_right,
    this.image = ''
    // this.textColor = AppColors.whiteColor,

    // this.iconName =Icons.arrow_circle_right,
    // this.iconNameColor = AppColors.whiteColor,
    // this.imageLeft ='',
    // this.iconYN = true,
    // this.bordercircular=30.0,
    // this.height =0,
    // this.fontsize =18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 9.sp, vertical: 9.sp),
          child: Titletype.index == 1
              ? Center(
                child: Text(
            title,
            style:
            TextStyle(fontWeight: FontWeight.bold),
          ),
              )
              : Titletype.index == 0 ? Icon(iconName)
          : Row(
            children: [
              Image(image: AssetImage(googlelogos1),height: 10,width: 10,),
              Text(
                title,
                style:
                TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),

        ),
      ),
    );
  }
}