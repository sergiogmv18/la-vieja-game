
import 'package:floor/floor.dart';
import 'package:la_vieja/dao/repository_base_dao.dart';
import 'package:la_vieja/models/user_models.dart';

@dao
abstract class UserAppDao extends ReposiroryBaseDao<UserApp> {
  @Query('SELECT * FROM UsersApp')
  Future<List<UserApp>> fetchAll();

  @Query('SELECT * FROM UsersApp WHERE id = :id')
  Future<UserApp?> fetchById(int id);
}

