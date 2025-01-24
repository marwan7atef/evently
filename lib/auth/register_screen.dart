import 'package:evently/app_theam.dart';
import 'package:evently/auth/login_Screen.dart';
import 'package:flutter/material.dart';
import '../Home/home_screen.dart';
import '../component/deafult_textButtom.dart';
import '../component/deafult_textformfield.dart';
import '../component/default_elevatedButtom.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName="/registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
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
                DeafultTextformfield(hintText: "Name",perfixicon: "profile",controller: nameController,validator: (value){
                  if(value==null||value.length<3){
                    return "Invaild Name";
                  }
                },),
                SizedBox(height: 16,),
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
                DefaultElevatedbutton(lable: "Create Account",onpressed: registerOnpressed,),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have Account ?",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppThem.black),),
                    SizedBox(width:5 ,),
                    DeafultTextbuttom(label: "Login",onpress:(){
Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

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
  void registerOnpressed(){
    if(formkey.currentState!.validate()){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

}
