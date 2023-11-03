
import 'package:flutter/material.dart';

import '../../../helper/image.dart';

class homeVariable
{
  PageController homeController = PageController(viewportFraction: .85);
  //print(homVariable.homeController+' what');
   int homeCurrentIndex =0;
   double homeRating =4.5;

}

List<String> homeImage = [food, ban2, ban3, ban4, ban5, ban6, ban7];
List<String> ChoiceList = [
  'All',
  'BBQ',
  'Desert',
  'Misc Charges',
  'Beverage',
  'Cold Coffee'
];

List<String> RecepiChoiceList = [
  'Chiken Wings Recipe',
  'Chiken Recipe',
  'Chiken Recipe',
  'Chiken Wings Recipe',
  'Chiken Wings Recipe',
  'Chiken Recipe',
  'Chiken Recipe',
  'Chiken Wings Recipe'
];