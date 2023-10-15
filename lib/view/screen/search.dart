import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';
import '../../widget/containerTextField.dart';
import '../../widget/textfield.dart';
import 'home_component/homeShareVariable.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  int RechoiceListIndex = 0;

  List<RecipeList> RecipeListClass = [
    RecipeList(
        title:'Chiken Wings Recipe',
        icon: FontAwesomeIcons.edit
    ),
    RecipeList(
        title:'Chiken Wings Recipe',
        icon: FontAwesomeIcons.edit
    ),
    RecipeList(
        title:'Chiken Wings Recipe',
        icon: FontAwesomeIcons.edit
    ),
    RecipeList(
        title:'Chiken Wings Recipe',
        icon: FontAwesomeIcons.edit
    ),
    RecipeList(
        title:'Chiken Wings Recipe',
        icon: FontAwesomeIcons.edit
    ),

  ];


  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // PreferredSize(
      //   preferredSize: Size.fromHeight(5.h),
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppBar(
            title: Text('Search',
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
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldContainer(
                  label: '',
                  hinttext: '',
                  TextController: search,
                  Keyboardtype: TextInputType.text
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      top: 3.h,
                    bottom: 5.h
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.3,
                    child: ListView.builder(
                        itemCount: RecipeListClass.length,
                        itemBuilder: (context,index){
                          return
                            Padding(
                              padding:  EdgeInsets.only(
                                //  bottom: 2.h,
                                left: 5.h,
                                right: 5.h,

                              ),
                              child: Container(
                              //  margin: EdgeInsets.only(top: 1.h , bottom: 1.h),
                                decoration: BoxDecoration(
                                  //borderRadius:  BorderRadius.circular(30.0),
                                  color: Colors.white,
                                  border:Border(
                                    bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(.5)),
                                  ),
                                ),
                                child: ListTile(

                                  trailing: FaIcon(RecipeListClass![index].icon!,size: 13,color: AppColors.grayColor,),


                                  visualDensity:VisualDensity(vertical: -3),
                                  title: Text(RecipeListClass![index].title!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.grayColor
                                      )),
                                ),
                              ),
                            );


                        }),
                  ),
                ),

                Text('Suggested Recipe',style:
                  TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 13 ),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                            top: 2.h,
                            left: 5.h,
                             right: 3.h
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 2.0,
                   runSpacing: 2.0,
                    children:
                      List<Widget>.generate(RecepiChoiceList.length, (index)
                      {
                                return ChoiceChip(
                                  label: Text(
                                    RecepiChoiceList[index],
                                    style: TextStyle(
                                        color: RechoiceListIndex == index
                                            ? Colors.white
                                            : Colors.white,
                                    fontSize: 13),
                                  ),
                                  selected:
                                  RechoiceListIndex == index ? true : false,
                                  //elevation: 20,
                                  visualDensity: const VisualDensity(
                                      vertical: -2, horizontal: 0),
                                  selectedColor: AppColors.primaryColor,
                                  disabledColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  side: BorderSide(color: AppColors.primaryColor),
                                  onSelected: (isSelected) {
                                    print(index);
                                    setState(() {
                                      RechoiceListIndex = 31;
                                    });
                                  },
                                );
                      }),

                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}



class RecipeList {

  String? title;
  IconData? icon;
  RecipeList(
      { this.title,
        this.icon});



}


