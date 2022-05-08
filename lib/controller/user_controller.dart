
import 'package:la_vieja/models/user_models.dart';

class UserController {


 /*
  * load last application language
  * Obs: this method is used to load translations in background and when app receive firebase message
  * @author SGV
  * @version 1.0 - 20210928 - initial release
  * @param<obj userApp> - user
  * @return  void
  */
  Future<void>saveLocalUser(UserApp? user)async{
    if(user != null){
        print(user.toMap());
    }

  }
}