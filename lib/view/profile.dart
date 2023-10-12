import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:sizer/sizer.dart';
import '../../helper/image.dart';
import '../widget/button.dart';
import '../widget/textfield.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
        body:

           SingleChildScrollView(
             child: Padding(
               padding:  EdgeInsets.only(top: 5.h),
               child: Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Center(
                  child: Text ('ABDUL HANNAN',
                               style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 24,
                                 ),
                             ),
                ),
                  Center(
                    child: Text ('abc@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*.5,
                    child: Stack(
                         children: [

                           Positioned(
                               bottom: 1.h,
                               left: 5.h,
                               right: 5.h,

                               child:
                               Container(
                                 width: MediaQuery.of(context).size.width*.2,
                                 height: MediaQuery.of(context).size.height*.35,
                                 decoration: BoxDecoration(
                                   // boxShadow: kElevationToShadow[1],
                                     boxShadow: [
                                       BoxShadow(
                                           color: AppColors.grayshade.withOpacity(.5),
                                           blurRadius: 10,
                                           offset: Offset(0, 10)),

                                       BoxShadow(
                                         color: Colors.white,
                                           offset: Offset(-10, 0)
                                       ),
                                       BoxShadow(
                                           color: Colors.white,
                                           offset: Offset(10, 0)
                                       ),

                                     ],


                                     color:Colors.white,// AppColors.grayshade.withOpacity(.5),
                                     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))

                                 ),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(horizontal: 3.h),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       TextfieldCustom(
                                           label: 'Name',
                                           hinttext: 'ABDUL HANNAN ',
                                           TextController: nameController,
                                           Keyboardtype: TextInputType.text,
                                       borderColor: AppColors.grayColor,
                                         fillColor :AppColors.grayColor.withOpacity(1),
                                       Iconyn: true,
                                        // avatarOnIcon:true,
                                       iconcolor: AppColors.primaryColor,
                                           sufficon: Icons.edit,),
                                       TextfieldCustom(
                                         label: 'Email',
                                         hinttext: 'abc@gmail.com ',
                                         TextController: emailController,
                                         Keyboardtype: TextInputType.emailAddress,
                                         borderColor: AppColors.grayColor,
                                         fillColor :AppColors.grayColor.withOpacity(1),
                                         Iconyn: true,
                                        // avatarOnIcon:true,
                                         iconcolor: AppColors.primaryColor,
                                         sufficon: Icons.edit,),
                                     ],
                                   ),
                                 ),
                               )

                           ),
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
                               left: 17.h,

                               child:
                               CircleAvatar(
                                 radius: 7.3  .h,
                                 backgroundColor: AppColors.primaryColor,
                                 child: CircleAvatar(
                                   radius: 7.h,
                                   backgroundImage: AssetImage(profileImage),
                                 ),
                               )

                           ),



                           //
                         ],
                       ),
                  ),
                  SizedBox(height: 5.h,),
                  PrimaryButton(
                      Titletype: titleType.OnlyTitle,
                      title: 'UPDATE',
                      textColor: AppColors.primaryColor,
                      backgroundColor: AppColors.blackColor,
                      iconName: Icons.arrow_forward,
                      width: 40.w,
                      height: 4.1.h,
                      onPress: () {

                      }),

                ]

          ),
             ),
           ),



    );
  }
}
