import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food/widget/chipfillter.dart';
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
  int choiceListIndex = 0;
  double rating = 4.5;
  List<String> image = [food, ban2, ban3, ban4, ban5, ban6, ban7, food];

  List<String> ChoiceList = [
    'All',
    'BBQ',
    'Desert',
    'Misc Charges',
    'Beverage',
    'Cold Coffee'
  ];

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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
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
                padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      image.length - 1,
                      (index) => InkWell(
                          onTap: () {
                            _controller.animateToPage(index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.slowMiddle);
                          },
                          child: buildIndicator(index))),
                ),
              ),
              //for padding alignment
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 2.h),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        Icon(Icons.arrow_forward_ios_sharp,
                            size: 15, color: AppColors.primaryColor),
                      ],
                    ),
                    Container(
                      height: 5.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ChoiceList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 1.h),
                              child: ChoiceChip(
                                label: Text(
                                  ChoiceList[index],
                                  style: TextStyle(
                                      color: choiceListIndex == index
                                          ? Colors.white
                                          : AppColors.primaryColor),
                                ),
                                selected:
                                    choiceListIndex == index ? true : false,
                                //elevation: 20,
                                visualDensity: const VisualDensity(
                                    vertical: -4, horizontal: -4),
                                selectedColor: AppColors.primaryColor,
                                disabledColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: AppColors.primaryColor),
                                onSelected: (isSelected) {
                                  setState(() {
                                    choiceListIndex = index;
                                  });
                                },
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                            itemCount: 16  ,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                               mainAxisSpacing: 1.5.h,
                            crossAxisSpacing: 1.5.h),
                            itemBuilder: (context,index)
                            {
                              return burgerGrid(index);
                            }
                        ),
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        )),


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
      height: 8.sp,
      width: 8.sp, //currentIndex== index ? 18.sp : 7.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? AppColors.primaryColor
              : Colors.grey.shade300
          //    border: Border.all(color: AppColors.primaryColor)
          ),
    );
  }

  Widget burgerGrid(int Index) {
    return Container(
        height: 15.h,
        width: 100.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(burger),
            //scale:23
          ),
        ),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.whiteColor.withOpacity(0),
                Colors.black,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 1.h,
                top: 1.h,
                child: CircleAvatar(
                  backgroundColor: AppColors.tranparentburger,
                  radius: 15,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.primaryColor,
                    size: 16,
                  ),
                ),
              ),
              Positioned(
                  top: 13.h,
                  left: 2.h,
                  child: Text(
                    'Crispy Beef Burger',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
              ),
              Positioned(
                  top: 15.5.h,
                  left: 2.h,
                  child: Text(
                    'by Jhon Jones',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,

                    ),
                  )
              ),
              Positioned(
                top: 18.h,
                left: 2.h,
                child: RatingStars(
                  value: rating,
                  onValueChanged: (v) {
                    //
                    setState(() {
                      rating = v;
                    });
                  },
                  starSize: 8.sp,
                  valueLabelVisibility: false,
                ),
              ),
              Positioned(
                top: 17.9.h,
                left: 10.h,
                child: Text('4.5',
                style :TextStyle(
                  color: Colors.white,
                  fontSize: 10
                )
                )
              ),
              Positioned(
                  top: 17.9.h,
                  right: 1.7.h,
                  child: Icon(Icons.alarm,
                  color: Colors.white,
                  size: 10,)

              ),
              Positioned(
                  top: 17.9.h,
                  right: 1.5.h,
                  child: Text('30 min',
                      style :TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}
