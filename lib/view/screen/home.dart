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
  List<String> listSoccerPlayers = [];
  @override
  Widget build(BuildContext context) {
    listSoccerPlayers.add("Cristiano Ronaldo");
    listSoccerPlayers.add("Lionel Messi");
    listSoccerPlayers.add("Robert Lewandowski");
    listSoccerPlayers.add("Neymar Jr.");
    listSoccerPlayers.add("Kylian Mbappé");
    listSoccerPlayers.add("Mohamed Salah");
    listSoccerPlayers.add("Sadio Mane");
    listSoccerPlayers.add("Kevin de Brune");
    listSoccerPlayers.add("Antoine Griezmann");
    listSoccerPlayers.add("Sergio Ramos");
    listSoccerPlayers.add("Luis Surez");
    return Scaffold(
      body:
      CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: CircleAvatar(
                child: Image(image: AssetImage(profile)),
                radius: 3.h,
                backgroundColor: Colors.white,
              ),
              actions: [

                Icon(Icons.notification_important,color: Colors.white,size: 3.5.h,),
                SizedBox(width: 2.h,),
                Icon(Icons.list,color: Colors.white,size: 3.5.h),
                SizedBox(width: 2.h,),



              ],//titleWidget(context),// BuildAppBar(),
              expandedHeight: 20.h,
              backgroundColor: Colors.black,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
              // title: titleWidget(context),
                background: Stack(
                  children: <Widget>[

                    Positioned(
                        left: 3.h,
                        top:  14.h,
                        child: Text('Hello, Jhon',style: TextStyle(color: Colors.grey),)
                    ),
                    Positioned(
                        left: 3.h,
                        top:  17.h,
                        child: Text('Make your own food,',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                    Positioned(
                        left: 3.h,
                      top:  19.5.h,
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
                        right: 1.h,
                        top:  21.h,
                        child: Container(
                         height: 3.5.h,
                          width: 4.h,

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

              ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                //rossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Feature Recipe'),
                  Transform(
                    transform:  Matrix4.skewX(-0.18),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.h),
                      height: 15.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        //color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(food),
                        //scale:23

                        ),

                      ),
                      child: Container(
                        height: 15.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.whiteColor.withOpacity(0),
                              AppColors.blackColor,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Beef Bihari Boti',
                                   style: TextStyle(
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w800,
                                       fontSize: 10.sp,
                                       color: AppColors.whiteColor
                                   ),),
                              Text(
                                ' by Jacob Jones',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 7.sp,
                                    color: AppColors.grayColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),

            // SliverFixedExtentList(
            //   itemExtent: 20,
            //   delegate: SliverChildListDelegate([
            //     Container(color: Colors.red),
            //     Container(color: Colors.green),
            //     Container(color: Colors.blue),
            //     Container(color: Colors.blueGrey),
            //   ]),
            // ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (context, index) {
            //       return Container(
            //         height: 50,
            //         alignment: Alignment.center,
            //         color: Colors.orange[100 * (index % 9)],
            //         child: Text('orange $index'),
            //       );
            //     },
            //     childCount: 9,
            //   ),
            // ),
            // SliverGrid(
            //   delegate: SliverChildBuilderDelegate(
            //         (context, index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('grid item $index'),
            //       );
            //     },
            //     childCount: 30,
            //   ),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     mainAxisSpacing: 15,
            //     crossAxisSpacing: 15,
            //     childAspectRatio: 2.0,
            //   ),
            // ),
            //
            //
            // SliverGrid.count(
            //   crossAxisCount: 3,
            //   mainAxisSpacing: 10.0,
            //   crossAxisSpacing: 10.0,
            //   childAspectRatio: 4.0,
            //   children: <Widget>[
            //     Container(color: Colors.red),
            //     Container(color: Colors.green),
            //     Container(color: Colors.blue),
            //     Container(color: Colors.red),
            //     Container(color: Colors.green),
            //     Container(color: Colors.blue),
            //   ],
            // ),
            //
            //
            //
           ]
      ),
    );
  }

  Widget titleWidget(BuildContext context)
  {
    return Padding(
      padding:  EdgeInsets.only(top: 0.9.h,left: 1.h,right: 1.h),
      child: Stack(
        children: [

          Row(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  child: Image(image: AssetImage(profile)),
                radius: 3.h,
                backgroundColor: Colors.white,
              ),
              Spacer(),
            Icon(Icons.notification_important,color: Colors.white,size: 3.5.h,),
              SizedBox(width: 2.h,),
              Icon(Icons.list,color: Colors.white,size: 3.5.h),
            ],
          ),
          Positioned(
            right: 6.h,
            top: 3.2.h,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: .5.h,
            ),
          ),
        ],
      ),
    );
  }
}
