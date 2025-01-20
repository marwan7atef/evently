import 'package:evently/app_theam.dart';
import 'package:flutter/material.dart';

class DefaultElevatedbutton extends StatelessWidget {
String lable;
VoidCallback onpressed;
DefaultElevatedbutton({required this.lable,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onpressed,
      child:Text("$lable",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppThem.white)),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.sizeOf(context).width, 56)


        )



    );
  }
}
