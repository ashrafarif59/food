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
    return  ChoiceChip(label: Text(widget.label),
            selected: false
    );
  }
}
