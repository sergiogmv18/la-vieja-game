import 'package:flutter/material.dart';
import 'package:la_vieja/view/main/welcome_screen.dart';
import 'view/la_vieja_game/la_vieja_screen.dart';
import 'view/main/mydata_screen.dart';
import 'view/main/splash_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
 '/': (BuildContext context) => const SplashScreen(),
// '/mydata': (BuildContext context) => MyDataScreen(),
'/welcome' : (BuildContext context) => const WelcomeScreen(),
'/game/vieja':(BuildContext context) =>  TwoPlayerGame()





  
  
};
