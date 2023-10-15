import 'package:flutter/material.dart';
import 'package:food/view/screen/notification.dart';
import 'package:food/view/screen/search.dart';

import 'package:sizer/sizer.dart';
import '../../../helper/colors.dart';
import '../../../helper/image.dart';


class homeSliverAppBar extends StatelessWidget {
  const homeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: CircleAvatar(
        child: Image(image: AssetImage(profile)),
        radius: 3.h,
        backgroundColor: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => notification(),
                ));
          },
         icon: Icon(
            Icons.notification_important,
            color: Colors.white,
            size: 3.5.h,
          ),
        ),
        SizedBox(
          width: 2.h,
        ),
        IconButton(
            onPressed: (){
            Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(Icons.list, color: Colors.white, size: 3.5.h),
        ),
        SizedBox(
          width: 2.h,
        ),
      ],
      //titleWidget(context),// BuildAppBar(),
      expandedHeight: 20.h,
      backgroundColor: Colors.black,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        // title: titleWidget(context),
        background: Stack(
          children: <Widget>[
            Positioned(
                left: 3.h,
                top: 14.h,
                child: Text(
                  'Hello, Jhon',
                  style: TextStyle(color: Colors.grey),
                )),
            Positioned(
                left: 3.h,
                top: 17.h,
                child: Text(
                  'Make your own food,',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            Positioned(
              left: 3.h,
              top: 19.5.h,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  children: [
                    TextSpan(
                        text: 'stay at ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: ' Home',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 1.h,
              top: 21.h,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => search(),
                    ));
                  },
                child: Container(
                  height: 3.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(color: AppColors.primaryColor, blurRadius: 100)
                    ],
                    color: AppColors.primaryColor,
                    //     borderRadius:
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
