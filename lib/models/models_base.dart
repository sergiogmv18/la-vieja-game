
import 'package:floor/floor.dart';

class ModelBase{

  @PrimaryKey(autoGenerate: true)
  final int ?id;
  ModelBase({this.id});

  // GETs
  int? getId(){
    return id;
  }

}