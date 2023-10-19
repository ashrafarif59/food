import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../helper/colors.dart';

class ingrdientproduct extends StatelessWidget {
  const ingrdientproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ingrdientList> ingrdientListClass = [
      ingrdientList(
          Name:'Mince (beef)',
          uom: '1/2KG'
      ),
      ingrdientList(
          Name:'Mince (beef)',
          uom: '1/2KG'
      ),
      ingrdientList(
          Name:'Ginger',
          uom: '1 Piece'
      ),
      ingrdientList(
          Name:'EGG',
          uom: '1 Piece'
      ),
      ingrdientList(
          Name:'EGG',
          uom: '1 Piece'
      ),
      ingrdientList(
          Name:'EGG',
          uom: '1 Piece'
      ),
      ingrdientList(
          Name:'EGG',
          uom: '1 Piece'
      ),
      ingrdientList(
          Name:'EGG',
          uom: '1 Piece'
      ),
    ];

    return  MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(

          itemCount: ingrdientListClass.length,
          itemBuilder: (context,index)
          {

            return SizedBox(
              height: 4.h,
              child: TimelineTile(
                isFirst: index==0 ? true : false,
                isLast: index==ingrdientListClass.length-1 ? true : false,
                beforeLineStyle: LineStyle(color: AppColors.primaryColor,
                    thickness:2
                ),
                indicatorStyle: IndicatorStyle(
                    width: 10,
                    color: AppColors.primaryColor
                ),
                endChild: Padding(
                  padding:  EdgeInsets.only(left: 2.h),
                  child: Row(
                    children: [
                      Text(ingrdientListClass[index].Name!,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor
                          )),
                      Spacer(),
                      Container(
                          width: 20.w,
                          child: Text(ingrdientListClass[index].uom!,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grayColor
                              )
                          )
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

class ingrdientList {
  String? Name;
  String? uom;
  ingrdientList(
      {this.Name,
        this.uom,
      });
}