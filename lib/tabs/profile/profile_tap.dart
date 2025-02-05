import 'package:evently/auth/login_Screen.dart';
import 'package:evently/component/default_elevatedButtom.dart';
import 'package:evently/firebase_service.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language",style: textStyle.labelMedium!.copyWith(fontWeight: FontWeight.bold),)


              ],


            ),
            SizedBox(
              height: 16,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("DarkMode",style: textStyle.labelMedium!.copyWith(fontWeight: FontWeight.bold),)

              ],



            ),
            SizedBox(
              height: 16,

            ),
            DefaultElevatedbutton(lable: "Logout", onpressed: (){
              FirebaseService.logout();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              Provider.of<UserProvider>(context,listen: false).updateUser(null);

            })





          ],


        ),
      ),
    );
  }
}
