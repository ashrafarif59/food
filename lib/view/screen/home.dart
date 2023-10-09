import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helper/colors.dart';
import '../../helper/image.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listSoccerPlayers = [];
  @override
  Widget build(BuildContext context) {
    listSoccerPlayers.add("Cristiano Ronaldo");
    listSoccerPlayers.add("Lionel Messi");
    listSoccerPlayers.add("Robert Lewandowski");
    listSoccerPlayers.add("Neymar Jr.");
    listSoccerPlayers.add("Kylian Mbappé");
    listSoccerPlayers.add("Mohamed Salah");
    listSoccerPlayers.add("Sadio Mane");
    listSoccerPlayers.add("Kevin de Brune");
    listSoccerPlayers.add("Antoine Griezmann");
    listSoccerPlayers.add("Sergio Ramos");
    listSoccerPlayers.add("Luis Surez");
    return Scaffold(
      body:
      CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: titleWidget(context),// BuildAppBar(),
              expandedHeight: 22.h,
              backgroundColor: Colors.black,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
              // title: titleWidget(context),
                background: Stack(
                  children: <Widget>[

                    Positioned(
                        left: 3.h,
                        top:  12.h,
                        child: Text('Hello, Jhon',style: TextStyle(color: Colors.grey),)
                    ),
                    Positioned(
                        left: 3.h,
                        top:  15.h,
                        child: Text('Make your own food,',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                    Positioned(
                        left: 3.h,
                      top:  18.h,
                        child:RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          children: [
                            TextSpan(
                                text: 'stay at ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),

                            TextSpan(
                              text:
                              ' Home',
                              style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold,
                              ),

                            ),
                          ],
                        ),
                    ),
                    ),
                    Positioned(
                        right: 1.h,
                        top:  20.h,
                        child: Container(
                         height: 3.5.h,
                          width: 4.h,

                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.primaryColor,
                                  blurRadius: 100
                              )
                            ],
                            color: AppColors.primaryColor,
                           //     borderRadius:
                          ),
                          child: Icon(Icons.search,color: Colors.white,),
                        ),
                    )



              //        ImageContainer(movie: movie),
                //      PlayButton(),
                //    ShareAndAddButton()
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                  children: [
                    ListTile(
                      tileColor: Colors.white,
                      title: Center(
                        child: Text(listSoccerPlayers[index],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 40,
                                color: Colors.green) //TextStyle
                        ), //Text
                      ), //Center
                    ),
                    Divider(height: 3,)
                  ],
                ), //ListTile
                childCount: 11,
              ), //SliverChildBuildDelegate
            ),
           ]
      ),
    );
  }

  Widget titleWidget(BuildContext context)
  {
    return Padding(
      padding:  EdgeInsets.only(top: 0.9.h,left: 1.h,right: 1.h),
      child: Stack(
        children: [

          Row(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  child: Image(image: AssetImage(profile)),
                radius: 3.h,
                backgroundColor: Colors.white,
              ),
              Spacer(),
            Icon(Icons.notification_important,color: Colors.white,size: 3.5.h,),
              SizedBox(width: 2.h,),
              Icon(Icons.list,color: Colors.white,size: 3.5.h),
            ],
          ),
          Positioned(
            right: 6.h,
            top: 3.2.h,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: .5.h,
            ),
          ),
        ],
      ),
    );
  }
}
