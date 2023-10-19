import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/view/profile.dart';
import 'package:sizer/sizer.dart';

import 'favorite.dart';
import 'home.dart';

class navigator extends StatefulWidget {
  const navigator({Key? key}) : super(key: key);

  @override
  State<navigator> createState() => _navigatorState();
}

class _navigatorState extends State<navigator> {
  int selectIndex = 0;
  void navSelected(int index) {
    setState(() {
      selectIndex = index;
    });
  }
  final List layout =[
    Home(),
    Favorite(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectIndex,
            backgroundColor: Colors.black,
            onTap: navSelected,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: selectIndex==0 ?
              navbar(Icons.home,'HOME',selectIndex)

                  :Icon(Icons.home_outlined,size: 35), label: ''),
              BottomNavigationBarItem(
                  icon: selectIndex==1 ?
                  navbar(Icons.favorite,'FAVOURITE',selectIndex) :
                  Icon(Icons.favorite_border_outlined,size: 35), label: ''),
              BottomNavigationBarItem(
                  icon: selectIndex==2 ?
                  navbar(Icons.account_circle_sharp,'PROFILE',selectIndex)
                  : Icon(Icons.account_circle_sharp,size: 35,
                  ), label: ''),



            ]),

        body: layout[selectIndex]
    );
  }

  Widget navbar(IconData icon,String title,int index )
  {
    return  Container(
      //margin: EdgeInsets.only(left: 2.h,top: 1.h,right: 1.h,bottom: 2.h),
      margin: EdgeInsets.all(0),
       width: double.infinity, //index==0 ? 12.w: 40.w,
      //height: 4.h,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30)
      ),

      child: Row  (children: [
        SizedBox(width: 1.h,),
        Icon(icon,size: 30,color: Colors.white,),
        SizedBox(width: .5.h,),
        Text(title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: index ==0 ? 14 :10
          ),)
      ],),
    );
  }
}
