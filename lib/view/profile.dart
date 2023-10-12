import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:sizer/sizer.dart';
import '../../helper/image.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 2.h,
              )),
        ),
      ),
       body:  Stack(
         children: [

           Positioned(
             top: 12.h,
             child: Container(
               height: 8.h,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(

                 //boxShadow: ,
                // color: Colors.white,
                 gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   colors: [
                     AppColors.grayshade.withOpacity(.5),
                     AppColors.whiteColor,
                   ],
                 ),
               ),
             ),
           ),
           Positioned(
             top: 4.h,
             left: 1.h,
             right: 1.h,
             child: CircleAvatar(
               radius: 7.2.h,
               backgroundColor: AppColors.primaryColor,
               child: Container(
                 child: Image(
                   image: AssetImage(profileImage),
                 ),
               ),
             ),
           ),
         ],
       )
       //  Column
       //   (
       //   children: [
       //     Text('ABDUL HANNAN'),
       //     Text('abc@gmail.com'),
       //
       //   ],
       // ),
    );
  }
}
