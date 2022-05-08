import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:la_vieja/database/play_game_database.dart';
import 'package:la_vieja/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';

GetIt serviceLocator = GetIt.instance;

/*
  * Register global instance of session and database
  * @author  SGV
  * @version 1.0 - 20220411 - initial release
  * @return  void
  */
Future setupLocator() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_run') ?? true) {
    FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool('first_run', false);
  }
  if (!serviceLocator.isRegistered<PlayGameDatabase>()) {
    PlayGameDatabase databaseInstance = await $FloorPlayGameDatabase.databaseBuilder('syncapp_database.db').build();
    serviceLocator.registerSingleton<PlayGameDatabase>(databaseInstance);
  }
  if (!serviceLocator.isRegistered<Session>()) {
    Session session = Session();
    serviceLocator.registerSingleton<Session>(session);
    await startSession();
  }
}

/*
  * set data session
  * @author  SGV
  * @version 1.0 - 202204113 - initial release
  * @return  void
  */
Future startSession() async {
  Session session = serviceLocator<Session>();
  UserApp? userApp = await serviceLocator<PlayGameDatabase>().userAppDao.fetchById(1);
  session.setValue('instanceName', userApp?.getFirtName());
  session.setValue('syncAppToken', userApp?.getLastName());

}
