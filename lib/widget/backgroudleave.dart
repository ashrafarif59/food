import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class bgleaveWidget extends StatelessWidget {
  String background;
  Widget? child;
  double scale;
  Alignment align;
  bgleaveWidget({Key? key,
                required this.background,
                required this.child,
                         this.scale = 3.5,
                         this.align = Alignment.bottomRight
                }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 87.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          alignment: align,
          scale: scale,
        ),
      ),
      child: child,
    );
  }
}
