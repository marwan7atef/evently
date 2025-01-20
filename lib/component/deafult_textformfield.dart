import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeafultTextformfield extends StatefulWidget {
  String hintText;
  String? perfixicon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool ispassword;
DeafultTextformfield({required this.hintText,this.perfixicon,this.controller,this.validator,this.ispassword=false});

  @override
  State<DeafultTextformfield> createState() => _DeafultTextformfieldState();
}

class _DeafultTextformfieldState extends State<DeafultTextformfield> {
late bool isobscure= widget.ispassword;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon:SvgPicture.asset("assets/icons/${widget.perfixicon}.svg",height: 24,width: 24,fit: BoxFit.scaleDown,),
        suffixIcon:widget.ispassword? IconButton(onPressed: (){
          isobscure=! isobscure;
          setState(() {

          });
        }, icon: Icon(!isobscure?Icons.visibility_off:Icons.visibility)):null




      ),
obscureText: isobscure,



    );
  }
}
