import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';
import 'notificationSetting.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List<SettingList> settingClass = [
      SettingList(
          title:'Notification',
          icon: Icons.arrow_forward_ios_sharp
      ),


    ];



    return Scaffold(
        // PreferredSize(
        //   preferredSize: Size.fromHeight(5.h),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: AppBar(
          title: Text('Setting',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
          ),
          centerTitle: true,
          //elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 2.h,
              )
          ),

        ),
      ),

      body:
      Padding(
        padding:  EdgeInsets.only(
                  top: 5.h,
                  left: 6.h,
                  right: 6.h

                                ),
        child: ListView.builder(
           itemCount: settingClass.length,
            itemBuilder: (context,index){
             return
             Padding(
               padding:  EdgeInsets.only(bottom: 2.h),
               child: GestureDetector(
                 onTap: (){
                   index==0 ?
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => NotificationSetting(),
                       ))
                       : null;
                 },
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius:  BorderRadius.circular(30.0),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                             color: AppColors.grayshade.withOpacity(.5),
                             blurRadius: 1,
                             offset: Offset(0, 4)),
                     ]

                 ),
                   child: ListTile(

                     trailing: Icon(settingClass![index].icon!,size: 15,),
                     visualDensity:VisualDensity(vertical: -4),
                     title: Text(settingClass![index].title!,
                             style: TextStyle(
                             fontSize: 15,
                               //fontWeight: FontWeight.bold,
                               color: AppColors.blackColor
                             )),
                   ),
                 ),
               ),
             );


            }),
      )
    );
  }


}


class SettingList {
  String? title;
  IconData? icon;
  SettingList(
      { this.title,
        this.icon});



}


