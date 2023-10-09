import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:food/widget/button.dart';
import 'package:sizer/sizer.dart';

import '../../helper/image.dart';
import 'AccountRegister.dart';
import 'login_screen.dart';

class onBoardPage extends StatefulWidget {
  const onBoardPage({Key? key}) : super(key: key);

  @override
  State<onBoardPage> createState() => _onBoardPageState();
}

class _onBoardPageState extends State<onBoardPage> {
  int pageIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<String> image = [board1, board2, board3];
    List<String> title = [
      'Get all the healthy recipes that you need',
      'Get the exact nutrition value of everything you eat',
      'Get daily calorie target based on your body weight'
    ];
    List<String> subtitle = [
      'Whether you are losing or gaining. wehave all the recipes you’ll need.',
      'We are updating our food database every minute to help you track your calories',
      'Set your target weight and select your monthly schedule, and we’ill do the rest'
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 10.sp),
            child: pageIndex == 2
                ? null
                : GestureDetector(
                  onTap: (){
                    if (pageIndex != 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }
                  },
                  child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey),
                    ),
                ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: PageView.builder(
               controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: pageIndex == 1 ? 30:0 ),
                              child: pageIndex == 1 ?  Image(image: AssetImage(shadow)) : null,
                            ),
                            Container(
                                height: pageIndex == 1 ? 28.h :40.h,
                                width: 40.h,
                                //   color: Colors.red,
                                child: Image(image: AssetImage(image[index]))),


                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     pageIndex==0?
                        //     lineContainer(context) :
                        //     Icon(Icons.circle_outlined,size: 1.5.h,color: AppColors.orangeAccent,),
                        //     SizedBox(width: 0.2.h,),
                        //     pageIndex==1?
                        //     lineContainer(context) :
                        //     Icon(Icons.circle_outlined,size: 1.5.h,color: AppColors.orangeAccent,),
                        //     SizedBox(width: 0.2.h,),
                        //     pageIndex==2?
                        //     lineContainer(context) :
                        //     Icon(Icons.circle_outlined,size: 1.5.h,color: AppColors.orangeAccent,),
                        //
                        //
                        //   ],
                        // ),
                        Column(
                          children: [
                            Text(
                              title[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 3.h),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Text(
                              subtitle[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            PrimaryButton(Titletype:  pageIndex==2 ? titleType.OnlyTitle : titleType.OnlyIcon,
                                                   title: 'Get Started',
                                                   width: pageIndex==2? 70.w : 13.w,
                                                    height: pageIndex==2? 5.h : 6.h,
                                                   iconName: Icons.arrow_forward,
                                                   onPress: (){
                                                     if (pageIndex == 2) {
                                                       Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                             builder: (context) => LoginScreen(),
                                                           ));
                                                     } else {
                                                       _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
                                                     }

                                                   }
                                                  )

                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          Positioned(
            top: 45.h,
            left: 20.h,
            child:  Row(
                children: List.generate(title.length, (index) => buildIndicator(index))


            ),
          )

        ],
      ),
    );
  }

  Widget lineContainer(BuildContext context) {
     return Container(height: 1.h,width: 3.h,
       decoration: BoxDecoration(
           color: AppColors.orangeAccent,
           borderRadius: BorderRadius.circular(10)
       ),

     );
}

  Container buildIndicator(int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.sp),
      height: 7.sp,
      width: pageIndex== index ? 18.sp : 7.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: pageIndex == index ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryColor)
      ),
    );
  }

}
