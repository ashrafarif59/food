import 'package:flutter/material.dart';
import 'package:food/view/screen/saleproduct/sliverProductAppbar.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/colors.dart';
import '../../../widget/button.dart';
import 'Productqty.dart';
import 'ingrdientproduct.dart';

class saleProductDetail extends StatefulWidget {
  const saleProductDetail({Key? key}) : super(key: key);

  @override
  State<saleProductDetail> createState() => _saleProductDetailState();
}

class _saleProductDetailState extends State<saleProductDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          sliverProductAppbar(title_name: '',
          height: 25,
          showRoundedContainer: false,),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  productQtyIncrement(
                    spaceBetween: 2,
                  ),

                SizedBox(height: 1.h,),
                  Container(
                      height: MediaQuery.of(context).size.height*.228,
                      child:ingrdientproduct(),

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
