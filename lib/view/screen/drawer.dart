import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/view/screen/setting.dart';
import 'package:food/view/screen/test/getLocation.dart';
import 'package:sizer/sizer.dart';

import '../../helper/image.dart';

class drawerWidget extends StatefulWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child:
              Padding(
                padding:  EdgeInsets.only(left: 1.h,top: 2.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 4.1.h,
                              backgroundColor: AppColors.grayColor,
                              child: CircleAvatar(
                                radius: 3.8.h,
                                backgroundColor: AppColors.whiteColor,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(profileImage),
                                  radius: 3.5.h,
                                ),

                              ),
                            ),
                            SizedBox(width: 1.h,),
                            Text('Chef Mode',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),),
                            Transform.scale(
                              scale: .09.h,
                              child: Switch(

                                activeColor: AppColors.primaryColor,
                                  trackColor: (value)
                                      ? const MaterialStatePropertyAll(AppColors.primaryLightColor)
                                      : const MaterialStatePropertyAll(Colors.grey),
                                  activeTrackColor: AppColors.primaryColor.withOpacity(.4),
                                //  trackOutlineColor : AppColors.primaryColor,

                                  value: value,
                                  onChanged: (val){
                                     setState(() {
                                      value=val;
                                      });
                                    }
                                    ),
                            ),



                          ],
                        ),
                      ),

                      SizedBox(height: 1.2.h,),
                      Text('ABDUL HANNAN',
                        style: TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                          ),

                      Text('abc@gmail.com',
                      style: TextStyle(
                      fontSize: 12,
                        color: AppColors.grayColor
                      ),
                      )


                    ]
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => setting(),
                    ));
              },
              child: Card(
                child: ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.settings,color: AppColors.primaryColor,size: 20,),
                  title: Text('Setting',
                  style: TextStyle(
                    fontSize: 12
                  ),),
                  trailing: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Card(
              child: ListTile(
                visualDensity: VisualDensity(vertical: -4),
                leading: Icon(Icons.logout,color: AppColors.primaryColor,size: 20,),
                title: Text('Log Out',
                  style: TextStyle(
                      fontSize: 12
                  ),),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getLocation(),
                    ));
              },
              child: Card(
                child: ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  leading: Icon(Icons.logout,color: AppColors.primaryColor,size: 20,),
                  title: Text('Geo Location',
                    style: TextStyle(
                        fontSize: 12
                    ),),
                  trailing: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 15),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}

