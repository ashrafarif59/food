import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/view/screen/saleproduct/productDetail.dart';
import 'package:sizer/sizer.dart';
import '../../helper/image.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../helper/colors.dart';
import '../widget/button.dart';
import 'screen/saleproduct/Productqty.dart';
import 'screen/saleproduct/ingrdientproduct.dart';
import 'screen/saleproduct/sliverProductAppbar.dart';

class saleProduct extends StatefulWidget {
  const saleProduct({Key? key}) : super(key: key);

  @override
  State<saleProduct> createState() => _saleProductState();
}

class _saleProductState extends State<saleProduct> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          sliverProductAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  productQtyIncrement(),


                  Container(
                    height: MediaQuery.of(context).size.height*.34,
                    child: Stack(
                      children: [

                        ingrdientproduct(),
                        Positioned(
                          bottom: .2.h,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 4,
                                  sigmaY: 4
                              ),
                              child: Container(
                                height: 5.h,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                              //  child: Text('sasdfsadfas'),

                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2.h,
                          left: 11.h,
                          right: 11.h,
                          child: PrimaryButton(
                              Titletype: titleType.OnlyTitle,
                              title: 'Complete Detail',
                              textColor: AppColors.whiteColor,
                           //   backgroundColor: AppColors.blackColor,
                              iconName: Icons.arrow_forward,
                              width: 40.w,
                              height: 4.5.h,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          saleProductDetail(),
                                    ));

                              }),
                        ),

                      ],
                    )

                  )




                ],
              ),
            ),
          ),
        ],
        //slivers: [
        //sliverProductAppbar()
        //]

      ),
    );
  }



}


