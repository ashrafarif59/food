import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:food/view/saleProduct.dart';
import 'package:food/view/screen/drawer.dart';
import 'package:food/view/screen/home_component/burgerGrid.dart';

import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';
import 'home_component/homeBanner.dart';
import 'home_component/homeShareVariable.dart';
import 'home_component/home_sliverAppbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homVariable  = homeVariable();
  int choiceListIndex = 0;
  double rating = 4.5;




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      endDrawer: drawerWidget(),
      body: CustomScrollView(

          slivers: [

        homeSliverAppBar(),
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
                      homeBanner(),
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
                              padding: EdgeInsets.only(right: 2.h,top: 1.h),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                child:



                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 16  ,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                          crossAxisCount: 2,
                                          mainAxisSpacing: 1.5.h,
                                          crossAxisSpacing: 1.5.h
                                      ),
                                      itemBuilder: (context,index)
                                      {
                                        return GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      saleProduct()
                                                ));
                                          },
                                            child: burgerGrid(Index: index)

                                        );

                                      }
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),


      ]
      ),
    );
  }








}
