import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  double rating = 4.5;
  List<String> image = [food, ban2, ban3, ban4, ban5, ban6, ban7, food];

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(viewportFraction: .85);

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: CircleAvatar(
            child: Image(image: AssetImage(profile)),
            radius: 3.h,
            backgroundColor: Colors.white,
          ),
          actions: [
            Icon(
              Icons.notification_important,
              color: Colors.white,
              size: 3.5.h,
            ),
            SizedBox(
              width: 2.h,
            ),
            Icon(Icons.list, color: Colors.white, size: 3.5.h),
            SizedBox(
              width: 2.h,
            ),
          ],
          //titleWidget(context),// BuildAppBar(),
          expandedHeight: 20.h,
          backgroundColor: Colors.black,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            // title: titleWidget(context),
            background: Stack(
              children: <Widget>[
                Positioned(
                    left: 3.h,
                    top: 14.h,
                    child: Text(
                      'Hello, Jhon',
                      style: TextStyle(color: Colors.grey),
                    )),
                Positioned(
                    left: 3.h,
                    top: 17.h,
                    child: Text(
                      'Make your own food,',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  left: 3.h,
                  top: 19.5.h,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      children: [
                        TextSpan(
                            text: 'stay at ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: ' Home',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 1.h,
                  top: 21.h,
                  child: Container(
                    height: 3.5.h,
                    width: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.primaryColor, blurRadius: 100)
                      ],
                      color: AppColors.primaryColor,
                      //     borderRadius:
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 3.h,
                ),
                child: Text(
                  'Feature Recipe',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 1.5.h),
                ),
              ),
              SizedBox(
                height: .5.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 17.h,

                  //width: 90.h,
                  //color:Colors.red,
                  child: PageView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: image.length + 1,
                      onPageChanged: (index) {
                        print(index);
                        if (index > 6) {
                          _controller.animateToPage(0,
                              duration: Duration(milliseconds: 50),
                              curve: Curves.slowMiddle);
                        }

                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      controller:
                          _controller, //PageController(viewportFraction: 0.5),
                      //  itemCount:5,
                      itemBuilder: (context, index) {
                        return foodBanner(index);
                      }),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 1.h,bottom: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    List.generate(
                        image.length-1, (index) => InkWell(
                      onTap: (){
                        _controller.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.slowMiddle);
                      },
                        child: buildIndicator(index)
                    )
                    )    ,

                ),
              )
            ],
          ),
        )),

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
      ]),
    );
  }

  Widget foodBanner(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Transform(
        transform: Matrix4.skewX(-0.10),
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 7.h),
          //margin: EdgeInsets.symmetric(horizontal: 5.h),
          //height: 5.h,
          //width: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image[index]),
              //scale:23
            ),
          ),
          child: Container(
            //height: 15.h,
            //width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
              padding: EdgeInsets.only(left: 1.h, bottom: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Beef Bihari Boti',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: 8.sp,
                        color: AppColors.whiteColor),
                  ),
                  Text(
                    ' by Jacob Jones',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 7.sp,
                        color: AppColors.grayColor),
                  ),
                  RatingStars(
                    value: rating,
                    onValueChanged: (v) {
                      //
                      setState(() {
                        rating = v;
                      });
                    },
                    starSize: 5.sp,
                    valueLabelVisibility: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.sp),
      height: 7.sp,
      width: 7.sp, //currentIndex== index ? 18.sp : 7.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? AppColors.primaryColor
              : Colors.grey.shade300
      //    border: Border.all(color: AppColors.primaryColor)
      ),
    );
  }
}
