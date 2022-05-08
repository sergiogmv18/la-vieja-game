// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:la_vieja/models/models_base.dart';

abstract class ReposiroryBaseDao<Model extends ModelBase> {
  @insert
  Future<int> insertLocally(Model object);

  @update
  Future<int> updateLocally(Model object);

  @delete
  Future<int> deleteLocally(Model object);

  Future<int> saveLocally(Model object) async {
    if (object.id != null) {
      //print('updating locally');
      await updateLocally(object);
      return object.id!;
    }
    int id = await insertLocally(object);
    //print('inserting locally');
    return id;
  }

  /*
   * remove obj
   * @author  SGV
   * @version 1.0 - 20211220 - initial release
   * @param <object> object
   * @param <bool> moveToTrash
   * @return  void
   */
  Future<void> remove(Model object, [bool moveToTrash = false]) async {
    // move to trash
    if (moveToTrash) {
      await saveLocally(object);
      return;
    }
    deleteLocally(object);
  }
}
