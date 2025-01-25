import 'package:evently/app_theam.dart';
import 'package:evently/component/nav_icon.dart';
import 'package:evently/creat_event.dart';
import 'package:evently/tabs/home/home_tap.dart';
import 'package:evently/tabs/love/love_tap.dart';
import 'package:evently/tabs/map/map_tap.dart';
import 'package:evently/tabs/profile/profile_tap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
 static const String routeName="/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex=0;
List<Widget> taps=[
  HomeTap(),
  MapTap(),
  LoveTap(),
  ProfileTap()



];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomAppBar(
        color:AppThem.primary ,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),

        child: BottomNavigationBar(elevation: 0,currentIndex:currentIndex,onTap: (value) {
          currentIndex=value;
          setState(() {

          });
        } ,items: [
          BottomNavigationBarItem(icon:NavIcon(imageIcon: "Home") ,activeIcon:NavIcon(imageIcon: "Home_active") ,label:"Home" ),
          BottomNavigationBarItem(icon:NavIcon(imageIcon: "Map") ,activeIcon:NavIcon(imageIcon: "Map_active") ,label:"Map" ),
          BottomNavigationBarItem(icon:NavIcon(imageIcon: "Love") ,activeIcon:NavIcon(imageIcon: "Love_active") ,label:"Love" ),
          BottomNavigationBarItem(icon:NavIcon(imageIcon: "User") ,activeIcon:NavIcon(imageIcon: "User_active") ,label:"Profile" )



        ]),
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(CreatEvent.routeName);


      },child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



    );
  }
}
