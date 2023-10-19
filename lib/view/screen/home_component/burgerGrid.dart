import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/colors.dart';
import '../../../helper/image.dart';

class burgerGrid extends StatefulWidget {
  int Index;
  double rating;
   burgerGrid({super.key, required this.Index, this.rating=4.5});

  @override
  State<burgerGrid> createState() => _burgerGridState();
}

class _burgerGridState extends State<burgerGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 15.h,
        width: 100.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(burger),
            //scale:23
          ),
        ),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryColor.withOpacity(0),
                Colors.black,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 1.h,
                top: 1.h,
                child: CircleAvatar(
                  backgroundColor: AppColors.tranparentburger,
                  radius: 15,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.primaryColor,
                    size: 16,
                  ),
                ),
              ),
              Positioned(
                  top: 13.h,
                  left: 2.h,
                  child: Text(
                    'Crispy Beef Burger',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
              ),
              Positioned(
                  top: 15.5.h,
                  left: 2.h,
                  child: Text(
                    'by Jhon Jones',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,

                    ),
                  )
              ),
              Positioned(
                top: 18.h,
                left: 2.h,
                child: RatingStars(
                  value: widget.rating,
                  onValueChanged: (v) {
                    //
                    setState(() {
                      widget.rating = v;
                    });
                  },
                  starSize: 8.sp,
                  valueLabelVisibility: false,
                ),
              ),
              Positioned(
                  top: 17.9.h,
                  left: 10.h,
                  child: Text('4.5',
                      style :TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      )
                  )
              ),
              Positioned(
                  top: 17.9.h,
                  right: 1.7.h,
                  child: Icon(Icons.alarm,
                    color: Colors.white,
                    size: 10,)

              ),
              Positioned(
                  top: 17.9.h,
                  right: 1.5.h,
                  child: Text('30 min',
                      style :TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}
