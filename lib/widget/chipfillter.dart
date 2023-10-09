import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:sizer/sizer.dart';

class chipWidget extends StatefulWidget {

   String label;

  chipWidget({Key? key,required this.label}) : super(key: key);

  @override
  State<chipWidget> createState() => _chipWidgetState();
}

class _chipWidgetState extends State<chipWidget> {
  bool _isSelected=false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: .5.h),
      child: Container(
       width: 13.h,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20)
      ),
        
        child: FilterChip(
          //labelPadding: EdgeInsets.all(10.h),
          label: Text(widget.label,
          style: TextStyle(
              fontSize: 12,
           // color: _isSelected? Colors.white : AppColors.primaryColor
          ),),
          backgroundColor: Colors.transparent,
            avatarBorder: LinearBorder.top(),
          //shadowColor: Colors.grey,
          //selected: _isSelected,
          onSelected: (isSelected)
          {
            setState(() {
              _isSelected=isSelected;
            });

          },
          //   avatar: iconyn == true ?CircleAvatar(child: Icon(iconName,size: 20,color: Colors.black,),backgroundColor: Colors.white,)
          //     :null,
          //shape:
        ),
      ),
    );
  }
}
