
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:la_vieja/controller/navigation_service_controller.dart';
import 'package:la_vieja/helpers/service_locator.dart';
import 'package:la_vieja/helpers/session.dart';

class FunctionsClass {
  Session session = serviceLocator<Session>();
  NavigationService navigationService =  NavigationService();
  /*
   * date parse
   * @author  SGV - 20220411
   * @version  20220411  adds support for dateString already in UTC and option to return dateTime in UTC
   * @param <String> dateString
   * @param <bool> asUTC -> returns the dateTime in UTC
   * @param <bool> isUTC -> the dateString provided is already in UTC
   * @return  DateTime
   */
  static DateTime? dateParse(String? dateString,{asUTC = false, isUTC = false}) {
    if (dateString == null) {
      return null;
    }
    DateTime? date;
    DateTime? computedDate;
    if (isUTC) {
      if (dateString.substring(dateString.length - 1) != 'Z') {
        dateString = dateString + 'Z';
      }
    }
    try {
      computedDate = DateTime.parse(dateString);
    } catch (error) {
      date = null;
    }
    if (asUTC == false) {
      date = computedDate!.toLocal();
    } else {
      date = computedDate!.toUtc();
    }
    return date;
  }

  /*
   * format date
   * @author  SGV - 20211225
   * @version 1.0 - 20211225 - initial release
   * @param <DateTime> date
   * @param <String> format
   * @return  String
   */
  static String? formatDate(DateTime? date, {String format = 'yyyy-MM-dd HH:mm:ss', isUTC = false}) {
    if (date == null) {
      return null;
    }
    String? dateString;
    try {
      DateFormat dateFormat = DateFormat(format);
      if (isUTC == false) {
        dateString = dateFormat.format(date);
      } else {
        dateString = DateFormat(format).parse(date.toString(), true).toString();
      }
    } catch (error) {
      dateString = null;
    }

    return dateString;
  }

  

  /*
  * Change bool value to int
  * @author  SGV
  * @version 1.0 - 20220411 - initial release
  * @return  int 
  */
  static int? changeBoolValueToInt(bool value) {
    int result = 0;
    if (value == true) {
      result = 1;
    }
    return result;
  }

  /*
  * Change int value to bool
  * @author  SGV
  * @version 1.0 - 20220411 - initial release
  * @return  bool 
  */
  static bool changeIntValueToBool(int value) {
    bool result = false;
    if (value == 1) {
      result = true;
    }
    return result;
  }

   /*
  * Sing-out and clean session and database
  * @author  SGV
  * @version 1.0 - 20220412 - initial release
  * @return  void
  */
  Future<void>getSingOut()async{
     FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
    //await serviceLocator<SyncappDatabase>().clearAllTables();
    session.clear();
    // restart session
   // startSession();

  }

}
