import 'package:evently/app_theam.dart';
import 'package:evently/models/catgory_item.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16,bottom: 16),
      decoration: BoxDecoration(
        color: AppThem.primary,
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16) ,bottomRight:Radius.circular(16) )



      ),
      child: SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back ✨",style: textStyle.labelLarge?.copyWith(color: AppThem.white),),
            Text("Marwan Atef",style: textStyle.titleLarge,),
            SizedBox(height: 16,),
            DefaultTabController(
                length: CatgoryItem.catgorys.length
                ,

                child: TabBar(
                onTap: (value) {
                  currentIndex=value;
                  setState(() {

                  });
                }
                ,
                tabAlignment: TabAlignment.start
                ,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent
                ,tabs: CatgoryItem.catgorys.map((catgoryTiem)=>TabItem(catgoryItem: catgoryTiem,isSelected:currentIndex==CatgoryItem.catgorys.indexOf(catgoryTiem),)).toList()))





          ],


        ),
      ),



    );
  }
}
