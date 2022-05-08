// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:la_vieja/dao/user_dao.dart';
import 'package:la_vieja/models/DateTimeConverter.dart';
import 'package:la_vieja/models/user_models.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'play_game_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(
  entities: [
    UserApp
  ], 
  version: 1
)
abstract class PlayGameDatabase extends FloorDatabase {
  UserAppDao get userAppDao;  


  /*
   * clear all tables
   * @author  SGV
   * @version 1.0 - 20212512 - initial release
   * @return  void
   */
  Future<void> clearAllTables() async {
    await database.execute('DELETE FROM UsersApp');   
  }
}
