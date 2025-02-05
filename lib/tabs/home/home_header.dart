import 'package:evently/app_theam.dart';
import 'package:evently/models/catgory_item.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
   EventsProvider eventProvider=Provider.of<EventsProvider>(context);
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
            Text(Provider.of<UserProvider>(context,listen: false).user!.name,style: textStyle.titleLarge,),
            SizedBox(height: 16,),
            DefaultTabController(
                length: CatgoryItem.catgorys.length+1
                ,

                child: TabBar(
                onTap: (value) {
                  if(value==currentIndex)return;

                  currentIndex=value;
                  eventProvider.changeCatgory(currentIndex==0?null:CatgoryItem.catgorys[currentIndex-1]);


                }
                ,
                tabAlignment: TabAlignment.start
                ,
                    labelPadding: EdgeInsets.all(16),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent
                ,tabs: [
                  TabItem(icon:Icons.all_inbox_outlined,label:"All",selectedBack: AppThem.white,selectedFor: AppThem.primary,unSelectedborder: AppThem.white,unSelectedFor: AppThem.white,isSelected:currentIndex==0,),
                  ...CatgoryItem.catgorys.map((catgoryTiem)=>TabItem(icon: catgoryTiem.icon,label: catgoryTiem.catName,selectedBack: AppThem.white,selectedFor: AppThem.primary,unSelectedborder: AppThem.white,unSelectedFor: AppThem.white,isSelected:currentIndex==CatgoryItem.catgorys.indexOf(catgoryTiem)+1,))]),)





          ],


        ),
      ),



    );
  }
}
