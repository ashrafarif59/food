import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: titleWidget(context),// BuildAppBar(),
              expandedHeight: 25.h,
              backgroundColor: Colors.black,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
              // title: titleWidget(context),
                background: Stack(
                  children: <Widget>[

                    Positioned(
                        left: 40,
                        right: 20,
                        top:  120,
                        child: Text('Hello, Jhon',style: TextStyle(color: Colors.grey),)
                    ),
                    Positioned(
                        left: 40,
                        right: 20,
                        top:  145,
                        child: Text('Make your own food,',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                    Positioned(
                        left: 40,
                        right: 20,
                        top:  170,
                        child:RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          children: [
                            TextSpan(
                                text: 'stay at ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),

                            TextSpan(
                              text:
                              ' Home',
                              style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold,
                              ),

                            ),
                          ],
                        ),
                    ),
                    ),
                    Positioned(
                        left: 345,
                        right: 20,
                        top:  200,
                        child: Container(
                         height: 30,

                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.primaryColor,
                                  blurRadius: 100
                              )
                            ],
                            color: AppColors.primaryColor,
                           //     borderRadius:
                          ),
                          child: Icon(Icons.search,color: Colors.white,),
                        ),
                    )



              //        ImageContainer(movie: movie),
                //      PlayButton(),
                //    ShareAndAddButton()
                  ],
                ),
              ),
            ),
           ]
      ),
    );
  }

  Widget titleWidget(BuildContext context)
  {
    return Row(
     mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
            child: Image(image: AssetImage(profile)),
          radius: 3.1.h,
          backgroundColor: Colors.white,
        ),
        Spacer(),
      Icon(Icons.notification_important,color: Colors.white,size: 4.h,),
        Icon(Icons.list,color: Colors.white,size: 4.h),
      ],
    );
  }
}
