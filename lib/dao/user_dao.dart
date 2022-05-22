
import 'package:PlayGame/dao/repository_base_dao.dart';
import 'package:PlayGame/models/user_models.dart';
import 'package:floor/floor.dart';


@dao
abstract class UserAppDao extends ReposiroryBaseDao<UserApp> {
  @Query('SELECT * FROM UsersApp')
  Future<List<UserApp>> fetchAll();

  @Query('SELECT * FROM UsersApp WHERE id = :id')
  Future<UserApp?> fetchById(int id);
}

