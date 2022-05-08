import 'package:flutter/material.dart';



class PlayGameStyle {
  static _CustomColors colors = _CustomColors();
  final ThemeData theme = ThemeData(
    primaryColor: colors.blueLogo,
    colorScheme: ColorScheme.fromSwatch().copyWith(primary:colors.lightBlue),
    errorColor: Colors.red,
    fontFamily: 'Baloo Bhaina',
    iconTheme: IconThemeData(color: Colors.black38),
    textTheme: TextTheme(
      headline2: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 72,
        color: Colors.white,       
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 52,
        height: 1.5,
        color: Colors.white
      ),
      headline4: TextStyle(
        fontSize: 32,
        height: 2,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
      headline5: TextStyle(
        height: 2,
        fontWeight: FontWeight.w400,
        fontSize: 30
      ),
      headline6: TextStyle(
        height: 2,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.black45
      ),
      subtitle1: TextStyle(
        height: 1,
      ),
      subtitle2: TextStyle(
        color: Colors.black45,
        fontSize: 16
      ),
      caption: TextStyle(
        height: 1.65,
        fontWeight: FontWeight.bold
        ),
        button: TextStyle( color: colors.blueShade,
        height: 1.2)
    )
  );
}

class _CustomColors {
  final Color blueLogo = Color(0xff3783ff);
  final Color lightBlue = Color(0xff9fd6ff);
  final Color blueShade = Color(0xff2d60b4);
}
class CustomColors {
  final Color blueLogo = Color(0xff3783ff);
  final Color lightBlue = Color(0xff9fd6ff);
  final Color blueShade = Color(0xff2d60b4);
}
class CustomColorsGames{
// Colors.
  final crossColor = const Color(0xFF1ABDD5);
  final circleColor = const Color(0xFFD8B9FA);
  final accentColor = const Color(0xFF90A4AE);


}



