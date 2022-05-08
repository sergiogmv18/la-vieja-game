

import 'package:floor/floor.dart';
import 'models_base.dart';

@Entity(tableName: 'UsersApp')
class UserApp extends ModelBase {
  String? firtName;
  String? lastName;

  
  UserApp({int? id, this.firtName, this.lastName, }) : super(id: id);
  // GET
  String? getFirtName() {
    return firtName;
  }
  String? getLastName(){
    return lastName;
  }

// SET 
  void setFirtName(String? firtName) {
    this.firtName =  firtName;
  }
  void setLastName(String? lastName) {
    this.lastName = lastName;
  }
  /// other methods
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'lastName':lastName,
      'firtName':firtName
    };
  }

}
