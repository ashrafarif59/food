import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  String dropDownValue = 'one';

  List dropDownListData = [
    {"title": "BCA", "value": "1"},
    {"title": "MCA", "value": "2"},
    {"title": "B.Tech", "value": "3"},
    {"title": "M.Tech", "value": "4"},
  ];
  String selectedCourseValue="";

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
   backgroundColor: Colors.white,
body: SafeArea(
  child:   Column(
    children: [
          Center(
  
        child: DropdownButton<String>
  
          (
  
          value: dropDownValue,
  
  
  
          icon: Icon(Icons.menu),
  
          style: TextStyle(color: Colors.black),
  
          underline: Container(
  
            height: 2,
  
              color: Colors.white,
  
          ),
  
          onChanged: (value){
  
            dropDownValue = value!;
  
          },
  
          items: [
  
            DropdownMenuItem(
  
                value: 'one',
  
                child: Text('One')
  
            ),
  
            DropdownMenuItem(
  
                value: 'two',
  
                child: Text('Two')
  
            ),
  
            DropdownMenuItem(
  
                value: 'three',
  
                child: Text('three')
  
            )
  
          ],
  
        ),
  
      ),
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)),
            contentPadding: const EdgeInsets.all(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCourseValue,
              isDense: true,
              isExpanded: true,
              menuMaxHeight: 350,
              items: [
                const DropdownMenuItem(
                    child: Text(
                      "Select Course",
                    ),
                    value: ""),
                ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                      child: Text(e['title']), value: e['value']);
                }).toList(),
              ],
              onChanged: (newValue) {
                setState(
                      () {
                    selectedCourseValue = newValue!;
                                },
                );
              },
            ),
          ),
        ),
      ),
    ],
  ),
),
          // items: _priorities.map((String dropDownStringItem) {
          //   return DropdownMenuItem<String> (
          //     value: dropDownStringItem,
          //     child: Text(dropDownStringItem),
          //   );
          // }).toList(),
          //
          // style: textStyle,
          //
          // value: getPriorityAsString(note.priority),
          //
          // onChanged: (valueSelectedByUser) {
          //   setState(() {
          //     debugPrint('User selected $valueSelectedByUser');
          //     updatePriorityAsInt(valueSelectedByUser);
          //   });
          // }
    );
  }
}
