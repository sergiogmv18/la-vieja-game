import 'package:PlayGame/helpers/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/navigation_service_controller.dart';
import 'controller/translation_controller.dart';
import 'route.dart';
import 'style.dart';

void main() async{
  await initializeDependencies();
  runApp(
     MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: TranslationController.getInstance(),
      ),
    ],
    child: const PlayGame(),
  ));
}

class PlayGame extends StatelessWidget {
  const PlayGame({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayGame',
      theme: PlayGameStyle().theme.copyWith(colorScheme:  PlayGameStyle().theme.colorScheme.copyWith(secondary: const Color(0XFf9fd6ff))),
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
      //  const TranslationDelegate(),
      //  GlobalMaterialLocalizations.delegate,
      //  GlobalWidgetsLocalizations.delegate,
      //  GlobalCupertinoLocalizations.delegate,
      ],
      routes: routes, 
      navigatorKey: NavigationService.navigatorKey,
      //supportedLocales: TranslationController.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}

/*
  * initialize dependencies
  * @author  SGV
  * @version 1.0 - 202210507 - initial release
  * @return  void
  */
Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize database and session
  await setupLocator();
}


