import 'package:flutter/material.dart';
import 'package:food/view/screen/notificationSetting.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List<NotificationList> notificationClass = [
      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),
      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),
      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),

      NotificationList(
          image: burger,
          title:'Chiken Wings Recipe',
          subtitle1: 'uploaded by ',
          subtitle2: 'James Jone',
          subtitle3: '2 min ago',
          icon: Icons.more_horiz
      ),


    ];



    return Scaffold(
        // PreferredSize(
        //   preferredSize: Size.fromHeight(5.h),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.h),
        child: AppBar(
          title: Text('Notificaiton',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
          ),
          bottom: PreferredSize(
              child: Divider(
                thickness: 1,
                height: 0,
              ),
              preferredSize: Size.fromHeight(0)
          ),
          // bottom: Divider(  thickness: 2,
          //   height: 0,),
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
                  left: 2.h,
                  right: 2.h

                                ),
        child: ListView.builder(
           itemCount: notificationClass.length,
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
                   leading: CircleAvatar(
                     backgroundImage: AssetImage(notificationClass![index].image!),
                   ),
                   subtitle:RichText(
                     text: TextSpan(
                       style: TextStyle(color: Colors.black, fontSize: 12),
                       children: [
                         TextSpan(
                             text: notificationClass![index].subtitle1!,
                             style: TextStyle(color: Colors.grey)),

                         TextSpan(
                             text:
                             notificationClass![index].subtitle2!,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11)
                         ),
                         WidgetSpan(
                           child: SizedBox(width:3.h),
                         ),
                         TextSpan(
                             text:
                             notificationClass![index].subtitle3!,
                             style: TextStyle(color: AppColors.grayColor,fontSize: 10)
                         ),
                       ],
                     ),
                   ),
                   trailing: Icon(notificationClass![index].icon!),
                   visualDensity:VisualDensity(vertical: -4),
                   title: Text(notificationClass![index].title!,
                           style: TextStyle(
                           fontSize: 13,
                             fontWeight: FontWeight.bold,
                             color: AppColors.primaryColor
                           )),
                 ),
               ),
             );


            }),
      )
    );
  }


}


class NotificationList {
  String? image;
  String? title;
  String? subtitle1;
  String? subtitle2;
  String? subtitle3;
  IconData? icon;
  NotificationList(
      {this.image,
        this.title,
        this.subtitle1,
        this.subtitle2,
        this.subtitle3,
        this.icon});



}


