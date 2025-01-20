import 'package:evently/app_theam.dart';
import 'package:evently/auth/register_screen.dart';
import 'package:flutter/material.dart';
import '../component/deafult_textButtom.dart';
import '../component/deafult_textformfield.dart';
import '../component/default_elevatedButtom.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName="/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Logo.png",height: MediaQuery.sizeOf(context).height*.2,)
                ,
                SizedBox(height: 24,),
                DeafultTextformfield(hintText: "Email",perfixicon: "email",controller: emailController,validator: (value){
                  if(value==null||value.length<5){
                    return "Invaild Email";
                  }
                },),
                SizedBox(height: 16,),
                DeafultTextformfield(hintText: "Password",perfixicon: "lock",controller:PasswordController,ispassword: true,validator:(value){
                  if(value==null||value.length<8){
                    return "Invaild Password";
                  }
                },),
                SizedBox(height: 24,),
              DefaultElevatedbutton(lable: "Login",onpressed: loginOnpressed,),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t Have Account ?",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppThem.black),),
                    SizedBox(width:5 ,),
                    DeafultTextbuttom(label: "Create Account",onpress:(){
                      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);


                    } ,),



                  ],


                )







              ],

            ),
          ),
        ),
      )

      ,



    );
  }
  void loginOnpressed(){
if(formkey.currentState!.validate()){

}
  }

}
