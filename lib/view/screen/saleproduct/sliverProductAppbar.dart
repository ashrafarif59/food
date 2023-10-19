import 'package:flutter/material.dart';
import 'package:food/view/screen/notification.dart';
import 'package:food/view/screen/search.dart';

import 'package:sizer/sizer.dart';
import '../../../helper/colors.dart';
import '../../../helper/image.dart';


class sliverProductAppbar extends StatelessWidget {
  String title_name;
  double height;
  double scrolledupValue;
  bool showRoundedContainer;
   sliverProductAppbar({super.key,
  this.title_name='Crispy Beef Burger',
  this.height=40,
  this.showRoundedContainer=true,
     this.scrolledupValue =1.0
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title_name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      expandedHeight: height.h,
      //collapsedHeight:7.h,
        centerTitle: true,
        pinned: true,
        automaticallyImplyLeading: false,
        backgroundColor: scrolledupValue>=151 ? Colors.black :Colors.white,

        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 3.h,
              color: Colors.white,
            )
        ),
        flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding:  EdgeInsets.only(bottom: 1),
          child: ContainerImageproduct(),
          ),
    ),
      bottom: showRoundedContainer ? PreferredSize(
        preferredSize:  Size.fromHeight(0.h),
        child:Container(
          height: 5.h,

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.white,
                width: 1
            )
            ,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.h),
                topRight: Radius.circular(2.h)

            ),

          ),
           padding: EdgeInsets.only(bottom: 2.h),
          child: Divider(color: AppColors.primaryColor,
              thickness:1.h,
              indent : 40.w,
            endIndent: 40.w,
          ),
        )
      ) : null,
    );
  }

  Widget ContainerImageproduct()
  {
    return Container(
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(saleProductImage),
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
      Colors.black.withOpacity(.5),
    Colors.orange.withOpacity(0),
    ],
    ),
    )
    )
    );
  }
}
