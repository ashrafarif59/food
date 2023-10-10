import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/colors.dart';
import '../../../helper/image.dart';
import 'homeShareVariable.dart';

class homeBanner extends StatefulWidget
{

   homeBanner({super.key});

  @override
  State<homeBanner> createState() => _homeBannerState();
}

class _homeBannerState extends State<homeBanner> {


  final homVariable  = homeVariable();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 17.h,

            //width: 90.h,
            //color:Colors.red,
            child: PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: homeImage.length + 1,
                onPageChanged: (index) {
                  print(index);
                  if (index > 6) {

                    homVariable.homeController.animateToPage(0,
                        duration: Duration(milliseconds: 50),
                        curve: Curves.slowMiddle);
                  }

                  setState(() {
                    homVariable.homeCurrentIndex = index ;
                  });

                },
                scrollDirection: Axis.horizontal,
                controller:
                homVariable.homeController, //PageController(viewportFraction: 0.5),
                //  itemCount:5,
                itemBuilder: (context, index) {
                  return foodBanner(index);
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                homeImage.length - 1,
                    (index) => InkWell(
                    onTap: () {

                      homVariable.homeController.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.slowMiddle);
                      },
                    child: buildIndicator(index)
                )),
          ),
        ),
      ],
    );
  }

  Widget foodBanner(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Transform(
        transform: Matrix4.skewX(-0.10),
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 7.h),
          //margin: EdgeInsets.symmetric(horizontal: 5.h),
          //height: 5.h,
          //width: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(homeImage[index]),
              //scale:23
            ),
          ),
          child: Container(
            //height: 15.h,
            //width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.whiteColor.withOpacity(0),
                  AppColors.blackColor,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 1.h, bottom: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Beef Bihari Boti',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: 8.sp,
                        color: AppColors.whiteColor),
                  ),
                  Text(
                    ' by Jacob Jones',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 7.sp,
                        color: AppColors.grayColor),
                  ),
                  RatingStars(
                    value: homVariable.homeRating,
                    onValueChanged: (v) {
                      //
                      setState(() {
                        homVariable.homeRating =v;
                      });
                    },
                    starSize: 5.sp,
                    valueLabelVisibility: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildIndicator(int index) {
    print(homVariable.homeCurrentIndex.toString()+ ' '+index.toString());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.sp),
      height: 8.sp,
      width: 8.sp, //currentIndex== index ? 18.sp : 7.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: homVariable.homeCurrentIndex == index
              ? AppColors.primaryColor
              : Colors.grey.shade300
        //    border: Border.all(color: AppColors.primaryColor)
      ),
    );
  }
}
