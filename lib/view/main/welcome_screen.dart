import 'dart:async';
import 'package:flutter/material.dart';
import 'package:la_vieja/component/button.dart';
import 'package:la_vieja/controller/translation_controller.dart';
import 'package:la_vieja/controller/user_controller.dart';
import 'package:la_vieja/models/user_models.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showProccessLoad = false;
  String? firtName;
  String? lastName;
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false, 
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(translate('welcome player'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 1),
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                
                scrollPadding : const EdgeInsets.all(0.0),
                decoration: InputDecoration(
                isDense: true,
                hintText: translate("firt name"),
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                initialValue: null,
                onChanged: (value) {
                  if(value.isNotEmpty){
                    setState(() {
                      firtName = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 1),
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                
                scrollPadding : const EdgeInsets.all(0.0),
                decoration: InputDecoration(
                isDense: true,
                hintText: translate("last name"),
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                initialValue: null,
                onChanged: (value) {
                  if(value.isNotEmpty){
                    setState(() {
                      lastName = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 20,),
            buttonComponent(
              context,
              onPressed: ()async{
                UserApp userApp = UserApp();
                userApp.setFirtName(firtName);
                userApp.setLastName(lastName);
                await UserController().saveLocalUser(userApp);
                Navigator.of(context).pushNamedAndRemoveUntil('/game/vieja', (route) => false,);
              },
              child: Text(translate('go')
              ),
            )
          ],
        ) 
      )
      )
    );
  }
}

