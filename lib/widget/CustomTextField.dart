import 'package:flutter/material.dart';
import 'package:food/helper/colors.dart';
import 'package:sizer/sizer.dart';

class GPATextField extends StatelessWidget {
  String? hintText;
  TextInputType? keyboardType;
  int? maxLength;
  double? horizontal;
  Widget? prefixIcon;
  Widget? suffixIcon;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      readOnly: readOnly,
      style: TextStyle(
       // color: Themes.setColor(context) ? GpaColors.blackColor : GpaColors.whiteColor,
        fontSize: 12.sp,
        fontFamily: 'nexaBold',
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        contentPadding: EdgeInsets.only(right: horizontal ?? 15.sp, left: horizontal ?? 15.sp, top: 5.sp),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'sofiaProLight',
          fontSize: 12.sp,
          //color: GpaColors.textFieldGrey,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: borderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: borderColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: borderColor,
            )),
      ),
    );
  }

  GPATextField(
      {this.hintText,
        this.keyboardType,
        this.maxLength,
        this.horizontal,
        this.prefixIcon,
        this.suffixIcon,
        this.onChanged,
        this.controller,
        this.validator,
        this.readOnly = false,
      this.borderColor = AppColors.primaryColor});
}
