import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<schoolClass> school = [
      schoolClass(
          name: 'class No 2',
          section: "guydsf",
          studentName: ['abc',
                        "jsbdvjks",
                        "hbvusdb"]
                )
                               ];

    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: school.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(school![index].name!),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      //i need nested length here should be 3
                      itemCount: school[index].studentName!.length,
                      itemBuilder: (context, ind) {
                        //but if the nested have first and last , yani multiple column and row?
                        // ye clear ho gya h???
                        //still not clear for mulitple column in nested
                        // search for 3d array in flutter where we can play on double index if still not understand than i'll make for you
                        //i already search for 2 days after all i connect you
                        // actually i am in bus now i can assist you at night  in sha aALlah
                        //In Sha Allah
                        return Text(school[index].studentName![ind].toString());
                      }),
                )
              ],
            );
          }),
    );
  }
}

class schoolClass {
  String? name;
  String? section;
  List<String>? studentName;
  schoolClass({
    this.name,
    this.section,
    this.studentName,
  });
}
//
// class studentName {
//   String name;
//   String lastname;
//   studentName( this.name, this.lastname);
//
// }
