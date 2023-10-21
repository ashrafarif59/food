import 'package:flutter/material.dart';
import 'package:food/view/screen/saleproduct/sliverProductAppbar.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/colors.dart';
import '../../../helper/image.dart';
import '../../../widget/button.dart';
import '../../saleProduct.dart';
import '../home_component/burgerGrid.dart';
import 'Productqty.dart';
import 'ingrdientproduct.dart';

class saleProductDetail extends StatefulWidget {
  const saleProductDetail({Key? key}) : super(key: key);

  @override
  State<saleProductDetail> createState() => _saleProductDetailState();
}

class _saleProductDetailState extends State<saleProductDetail> {
  int languageListIndex = 0;
  List<String> languageList =['ENGLISH','URDU'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              double  scrolledupValue = constraints.scrollOffset;

              return sliverProductAppbar(title_name: scrolledupValue>=151 ? 'Crispy Beef Burger' :'',
                height: 25,
                showRoundedContainer: false,
              scrolledupValue: scrolledupValue,);
            },
          )
          ,
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        productQtyIncrement(
                          spaceBetween: 2,
                        ),

                        SizedBox(height: 1.h,),
                        Container(
                          height: MediaQuery.of(context).size.height*.228,
                          child:ingrdientproduct(),

                        ),
                        SizedBox(height: 3.h,),
                        Text(
                          'DESCRIPTION:' ,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),

                        SizedBox(height: 2.h,),

                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 5.h,
                            runSpacing: 10.0,
                            children:
                            List<Widget>.generate(languageList.length, (index)
                            {
                              return RawChip(
                                showCheckmark: false,
                                label: Text(
                                  languageList[index],
                                  style: TextStyle(
                                      color: languageListIndex == index
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                      fontSize: 13),
                                ),
                                selected:
                                languageListIndex == index ? true : false,
                                //elevation: 20,
                                visualDensity: const VisualDensity(
                                    vertical: -2, horizontal: 0),
                                selectedColor: AppColors.primaryColor,
                                disabledColor:  AppColors.whiteColor,
                                backgroundColor:  languageListIndex == index ? AppColors.primaryColor : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                side: BorderSide(color: AppColors.primaryColor),
                                onSelected: (isSelected) {
                                  print(index);
                                  setState(() {
                                    languageListIndex = index;
                                  });
                                },
                              );
                            }),

                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Container(
                          height: languageListIndex==0 ? 53.h : 35 .h,
                          child:languageListIndex==0 ?
                          RichText(
                              //maxLines:5,
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              children: [
                                TextSpan(
                                    text: 'Heat oil in a wok, add finely chopped chicken, cook till it changes'
                                ' color, add ginger garlic paste with dry seasonings, lemon juice,'
                                ' cook till chicken tender and mixture dry, remove the chicken and leave aside.',
                                //    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)
                                ),
                                WidgetSpan(
                                  child: SizedBox(height: 5.h,)
                                ),
                                TextSpan(
                                    text: 'Heat oil in a wok, add finely chopped chicken, cook till it changes'
                                    ' color, add ginger garlic paste with dry seasonings, lemon juice,'
                                    ' cook till chicken tender and mixture dry, remove the chicken and'
                                    ' leave aside.',
                                //    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)
                                ),
                                WidgetSpan(
                                    child: SizedBox(height: 5.h,)
                                ),
                                TextSpan(
                                  text: 'Heat oil in a wok, add finely chopped chicken, cook till it changes'
                                      ' color, add ginger garlic paste with dry seasonings, lemon juice,'
                                      ' cook till chicken tender and mixture dry, remove the chicken and'
                                      ' leave aside.',
                                  //    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)
                                ),
                                WidgetSpan(
                                    child: SizedBox(height: 5.h,)
                                ),
                                TextSpan(
                                  text: 'Heat oil in a wok, add finely chopped chicken, cook till it changes'
                                      ' color, add ginger garlic paste with dry seasonings, lemon juice,'
                                      ' cook till chicken tender and mixture dry, remove the chicken and'
                                      ' leave aside.',
                                  //    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)
                                ),

                                WidgetSpan(
                                    child: SizedBox(height: 5.h,)
                                ),
                                TextSpan(
                                  text: 'Heat oil in a wok, add finely chopped chicken, cook till it changes'
                                      ' color, add ginger garlic paste with dry seasonings, lemon juice,'
                                      ' cook till chicken tender and mixture dry, remove the chicken and'
                                      ' leave aside.',
                                  //    style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)
                                ),

                              ],
                            ),
                          )
                          :
                          Column(
                           // mainAxisAlignment: MainAxisAlignment.center,
                         //   crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 3.h,),
                             Image(image: AssetImage(emojisad)) ,
                              SizedBox(height: 5.h,),
                              Center(
                                child: Text(
                                  'URDU VERSION NOT AVAILABLE' ,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [


                        Text(
                          'You also like:' ,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                          ),
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
                                      mainAxisExtent :20.h,
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
                                        child: //Container()
                                        burgerGrid(Index: index)

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
            ),
          ),
        ],
        //slivers: [
        //sliverProductAppbar()
        //]

      ),
    );
  }
}
