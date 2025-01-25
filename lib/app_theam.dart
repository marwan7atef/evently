import 'package:flutter/material.dart';

class AppThem{
  static const Color primary=Color(0xff5669FF);
  static const Color light=Color(0xffF0F0F0);
  static const Color red=Color(0xffD80027);
  static const Color dark=Color(0xff101127);
  static const Color gray=Color(0xff7B7B7B);
  static const Color black=Color(0xff1C1C1C);
  static const Color white=Color(0xffFFFFFF);

  static ThemeData lightMode=ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primary,
    foregroundColor: white,
    shape: CircleBorder(
      side: BorderSide(color: white,width: 5)


    )

  )
  ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: white,
      type: BottomNavigationBarType.fixed



    ),
primaryColor: primary,
   appBarTheme: AppBarTheme(
     backgroundColor:light,
     foregroundColor: primary,
centerTitle: true ,
       titleTextStyle: TextStyle(
       fontWeight:FontWeight.bold ,
     fontSize: 22,
     color: primary,


   )

   )
,
    scaffoldBackgroundColor: light
,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: gray,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: gray,

        ),
        borderRadius: BorderRadius.circular(16)


      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: gray,

          ),
          borderRadius: BorderRadius.circular(16)


      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: red,

          ),
          borderRadius: BorderRadius.circular(16)


      )



    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
           foregroundColor: white,
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),

          )


        )



    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: black,
        fontSize: 10,
          fontWeight:FontWeight.w400


      ),
      titleLarge: TextStyle(

          color: white,
          fontSize: 24,
          fontWeight:FontWeight.bold

      )
      ,
      bodySmall: TextStyle(
          color: black,
          fontSize: 12,
          fontWeight:FontWeight.w400


      ),
      labelLarge: TextStyle(
          color: black,
          fontSize: 14,
          fontWeight:FontWeight.w400


      ),
      bodyLarge: TextStyle(
          color: black,
          fontSize: 16,
          fontWeight:FontWeight.w400


      ),
      labelMedium: TextStyle(
          color:black,
          fontSize: 20,
          fontWeight:FontWeight.w500


      )



    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: primary,
fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline

        )


      )



    )


  );
  static ThemeData darkMode=ThemeData(




  );




}