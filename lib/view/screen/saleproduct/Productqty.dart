import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/colors.dart';
import '../../../helper/image.dart';

class productQtyIncrement extends StatefulWidget {
  double spaceBetween;
   productQtyIncrement({Key? key,
   this.spaceBetween=3}) : super(key: key);

  @override
  State<productQtyIncrement> createState() => _productQtyIncrementState();
}

class _productQtyIncrementState extends State<productQtyIncrement> {
  int qty =1;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Crispy Beef Burger',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor
              ),),
            Spacer(),
            Column(
              children: [
                Text('Rate the chief',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor
                    )),
                Row(
                  children: [
                    RatingStars(
                      value: 4.5,
                      starSize: 7.sp,
                      valueLabelVisibility: false,
                    ),
                    Text('   4.5',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor
                        ))
                  ],
                ),

              ],
            ),
          ],
        ),
        Text('Racipe by Jame Jones',
            style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: AppColors.grayColor
            )),
        SizedBox(height: widget.spaceBetween.h,),
        Row(
          children: [
            Text('Estimated Time',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor
              ),),
            Spacer(),
            Container(
              width: 18.w,
              //color: Colors.red,
              child: Center(
                child: Text('30 min',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),),
              ),
            ),
          ],
        ),
        SizedBox(height: widget.spaceBetween.h,),
        Row(
          children: [
            Text('Require Plates',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor
              ),),
            Spacer(),
            Container(
                width: 20.w,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        if (qty>1)
                          {setState(() {
                            qty--;
                          });}


                      },
                        child: incrementContainer (minusImage)
                    ),
                    Text(qty.toString()),
                    InkWell(
                        onTap: (){
                          setState(() {
                            qty++;
                          });
                        },
                        child: incrementContainer (plusImage))

                  ],
                )
            ),
          ],
        ),
        SizedBox(height: widget.spaceBetween.h,),
        Text('INGREDIENTS:',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor
          ),) ,
      ],
    );
  }

  Widget incrementContainer (String ImageString)
  {
    return  Container(
      width: 2.5.h,
      height: 2.5.h,

      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey.withOpacity(.2),
            width: 2
        ),

        color: Colors.white,
        image: DecorationImage(
          //fit: BoxFit.scaleDown,
          scale:.8,
          image: AssetImage(ImageString),
          //scale:23
        ),
      ),


    );
  }

}
