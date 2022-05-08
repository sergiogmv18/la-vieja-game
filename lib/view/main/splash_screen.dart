import 'dart:async';
import 'package:flutter/material.dart';
import 'package:la_vieja/helpers/service_locator.dart';
import 'package:la_vieja/helpers/session.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool showProccessLoad = false;
  @override
  void initState() {
   
    super.initState();
    Timer.run(() async{  
    verifyUser();      
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false, 
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body:const Center(child: CircularProgressIndicator(),)
      )
    );
  }

  /* Verify if have user Logged and will show the logo until that verification is finished
   * @author  SGV - 20220407
   * @version 1.0 - 20220407 - initial release
   * @param <>
   * @return <view> 
   */
  verifyUser() async{
  //  await TranslationController.getInstance().loadTranslations();
    Session session = serviceLocator<Session>(); 
    final prefs = await SharedPreferences.getInstance();
    if (session.getValue('instanceName') != null && prefs.getBool('first_Confirmation') == true) {
      Navigator.of(context).pushNamedAndRemoveUntil('/mydata', (route) => false);
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
    }  
  }
}

