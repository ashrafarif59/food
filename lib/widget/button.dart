import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../helper/colors.dart';
import '../helper/image.dart';
enum titleType {OnlyIcon,OnlyTitle,ImageAndTitle}

class PrimaryButton extends StatelessWidget {

  titleType Titletype;
  String title;
  double width;
  double height;
  VoidCallback onPress;
  Color  backgroundColor;
  IconData iconName;
  String image;
  double imageHeight;
  double imageWidth;
  double imagespace;


   Color textColor;

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
    this.image = '',
    this.imageHeight = 12,
    this.imageWidth = 15,
    this.width = 50,
    this.height = 10,
    this.imagespace =5,
     this.textColor = AppColors.blackColor,


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
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Titletype.index == 1
            ? Center(
              child: Text(
          title,
          style:
          TextStyle(fontWeight: FontWeight.bold,
          color: textColor),
        ),
            )
            : Titletype.index == 0 ? Icon(iconName)
        : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.sp,),
            Image(image: AssetImage(googlelogos1),height: imageHeight,width: imageWidth,),
            SizedBox(width: imagespace.sp,),
            Text(
              title,
              style:
              TextStyle(fontWeight: FontWeight.bold),

            )
          ],
        ),
      ),
    );
  }
}