import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String>? productImage;
    // List<String>? productName;
    // List<String>? productRating;
    // List<String>? productTimer;
    // List<String>? productBy;
    List<CategoryList> category = [
      CategoryList(
        categoryName: 'Deserts',
        productImage: [cake, donut, cameral, ban5],
        productName: ['Carrot Cake', 'Maple Fudge', 'Best Butter Tarts'],
        productRating: [4.5, 3, 2.5],
        productTimer: ['30 min', '15 min', '25 min'],
        productBy: ['By Ashraf ', 'By Arif ', 'By Candian Managemetn'],
      ),
      CategoryList(
        categoryName: 'Burger',
        productImage: [burger, burger, burger, burger],
        productName: ['Chicken Burger', 'Beef Burger', 'BBQ Budget'],
        productRating: [3.5, 5, 1.5],
        productTimer: ['30 min', '15 min', '25 min'],
        productBy: ['By Ashraf ', 'By Arif ', 'By Candian Managemetn'],
      ),
      CategoryList(
        categoryName: 'B.B.Q',
        productImage: [bbq, bbq, bbq, bbq],
        productName: ['Kabab', 'Mutton Tikka', 'Tikka boti'],
        productRating: [5, 4.5, 5],
        productTimer: ['30 min', '45 min', '25 min'],
        productBy: ['By Ashraf ', 'By Arif ', 'By Candian Managemetn'],
      )
    ];

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppBar(
            title: Text(
              'Favourite Recipe',
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: category.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                      child: Row(
                        children: [
                          Text(
                            category![index].categoryName!,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h,right: 1.h,left: 1.h),
                      child: Container(
                        height: 22.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            //i need nested length here should be 3
                            itemCount: category[index].productName!.length,
                            itemBuilder: (context, ind) {
                              //but if the nested have first and last , yani multiple column and row?
                              // ye clear ho gya h???
                              //still not clear for mulitple column in nested
                              // search for 3d array in flutter where we can play on double index if still not understand than i'll make for you
                              //i already search for 2 days after all i connect you
                              // actually i am in bus now i can assist you at night  in sha aALlah
                              //In Sha Allah
                              return foodRecipi(
                                  category[index].productImage![ind],
                                  category[index].productName![ind],
                                  category[index].productRating![ind],
                                  category[index].productBy![ind],
                                  category[index].productTimer![ind]);
                            }),
                      ),
                    )
                  ],
                );
              }),
        ));
  }

  Widget foodRecipi(String image, String ProductName, double starRating,
      String productBy, String timer) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .5.h),
      child: Container(
          height: 15.h,
          width: 130.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
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
                  AppColors.primaryColor.withOpacity(0),
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
                      ProductName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 15.5.h,
                    left: 2.h,
                    child: Text(
                      productBy,
                      style: TextStyle(
                          color: AppColors.graypic,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  top: 18.h,
                  left: 2.h,
                  child: RatingStars(
                    value: starRating,
                    starSize: 8.sp,
                    valueLabelVisibility: false,
                  ),
                ),
                Positioned(
                    top: 17.9.h,
                    left: 10.h,
                    child: Text(starRating.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10))),
                Positioned(
                    top: 18.2.h,
                    right: 12.w,
                    child: Icon(
                      Icons.alarm,
                      color: Colors.white,
                      size: 10,
                    )),
                Positioned(
                    top: 17.9.h,
                    right: 1.5.h,
                    child: Text(timer,
                        style: TextStyle(color: Colors.white, fontSize: 10)))
              ],
            ),
          )),
    );
  }
}

class CategoryList {
  String? categoryName;
  List<String>? productImage;
  List<String>? productName;
  List<double>? productRating;
  List<String>? productTimer;
  List<String>? productBy;
  CategoryList(
      {this.categoryName,
        this.productImage,
        this.productName,
        this.productRating,
        this.productTimer,
        this.productBy});
}
//
// class studentName {
//   String name;
//   String lastname;
//   studentName( this.name, this.lastname);
//
// }