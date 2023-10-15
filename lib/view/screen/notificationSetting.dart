import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool valueNotification = false;
  List<NotificationSettingList> NotificationSettingClass = [
    NotificationSettingList(
        title:'New Recipe update',
        child: null
    ),


  ];

  @override
  Widget build(BuildContext context) {



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
              itemCount: NotificationSettingClass.length,
              itemBuilder: (context,index){
                return
                  Padding(
                    padding:  EdgeInsets.only(bottom: 2.h),
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

                        trailing: Transform.scale(
                          scale: .09.h,
                          child: Switch.adaptive(

                              activeColor: AppColors.primaryColor,
                              trackColor: (valueNotification)
                                  ? const MaterialStatePropertyAll(AppColors.primaryLightColor)
                                  : const MaterialStatePropertyAll(AppColors.primaryLightColor),
                              activeTrackColor: AppColors.primaryColor.withOpacity(.4),
                              //  trackOutlineColor : AppColors.primaryColor,

                              value: valueNotification,
                              onChanged: (val){
                                print(val.toString());
                                setState(() {
                                  valueNotification=val;
                                });
                                print(valueNotification.toString());
                              }
                          ),
                        ),
                        visualDensity:VisualDensity(vertical: -4),
                        title: Text(NotificationSettingClass![index].title!,
                            style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: AppColors.blackColor
                            )),
                      ),
                    ),
                  );


              }),
        )
    );
  }
}


class NotificationSettingList {
  String? title;
  Widget? child;
  NotificationSettingList(
      { this.title,
        this.child});



}


