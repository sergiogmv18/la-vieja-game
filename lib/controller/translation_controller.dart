
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:i18n_extension/i18n_extension.dart';
/// A singleton that handles the translations and Locale operations
class TranslationController extends ChangeNotifier {
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
    Locale('pt'),
    Locale('pt', 'BR'),
  ];


  static final TranslationController _instance = TranslationController._();
  static String get localeTag => localeStatic.toString();
  static Locale? localeStatic;
  static String get formattedLocaleTag => formatLocaleToDbString(localeTag);
  Locale? get locale => localeStatic;
  String? defaultLocale;
  bool? withTranslations;

  Translations _translations = Translations('en');
  TranslationController._() {
    withTranslations = false;
  }

  factory TranslationController.getInstance() => _instance;

  Future<void> loadTranslations() async {
    notifyListeners();
    _translations = Translations('placeholder');
    List? translationsDataCurrent;
    List translationJson = [];
    List formatTranslation = [];
    if(translationsDataCurrent != null){
    
      for (Map translationElement in translationJson) {
        formatTranslation.add({
          "placeholder": translationElement['placeholder'].replaceAll('@appMobile', '') ?? '' , 
          'pt_br': translationElement['ptbr'] ?? '' ,
          'fr':translationElement['fr'] ?? '' ,
          'de':translationElement['de'] ?? '' ,
          'it':translationElement['it'] ?? '' ,
          'pt':translationElement['pt'] ?? '' ,
        });    
      }
      for(Map translationStandard in formatTranslation){
        Map<String, String> tmp = translationStandard.cast<String, String>();
        _translations += tmp;
      }
    }
    notifyListeners();
  }

  /// Translates [text] by looking up to corresponding
  String translate(String text, [Locale? locale]) {
    Locale? languageCode;
    if (locale != null) {
      languageCode = locale;
    } else {
      languageCode = localeStatic;
    }
    return localize(text, _translations, locale: languageCode.toString());
  }
  /// Converts the locale string to the format used in TranslationEntry database table
  static String formatLocaleToDbString(String localeTag) {
    return localeTag.replaceAll(RegExp('[^A-Za-z]'), '').toLowerCase();
  }

  /// Converts the locale string used in the TranslationEntry database table to the conventional format
  static String formatDbStringToLocale(String dbString) {
    if (dbString.length != 2 && dbString.length != 4) {
      return null.toString();
    }
    return dbString.replaceAllMapped(RegExp(r'([A-Z]\w)'), (Match m) => '_${m[0]!.toUpperCase()}');
  }
}

class TranslationDelegate extends LocalizationsDelegate<TranslationController> {
  const TranslationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'pt'].contains(locale.languageCode);

  @override
  Future<TranslationController> load(Locale locale) async {
    TranslationController translation = TranslationController.getInstance();
    if(TranslationController.localeStatic != null){
      return translation;
    }
    // await AppDatabase.getInstance().initializeDatabase();
    await translation.loadTranslations();
    TranslationController.localeStatic = locale;
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: 'lastApplicationLanguage', value: TranslationController.localeTag);
    return translation;
  }

  /*
   * load last application language
   * Obs: this method is used to load translations in background and when app receive firebase message
   * @author SGV
   * @version 1.0 - 20210928 - initial release
   * @return  void
   */
  Future<void> loadLastApplicationLanguage() async {
    if(TranslationController.localeStatic == null || TranslationController.localeStatic.toString() == "null"){
      FlutterSecureStorage storage = FlutterSecureStorage();
      String? lastApplicationLanguage = await storage.read(key: 'lastApplicationLanguage');
      lastApplicationLanguage = lastApplicationLanguage != null && lastApplicationLanguage.isNotEmpty ? lastApplicationLanguage : 'en';
      await load(Locale.fromSubtags(languageCode: lastApplicationLanguage));
    }
  }

  @override
  bool shouldReload(TranslationDelegate old) => false;
}

/*
 * Check the first letter in case estella lowercase will be changed to uppercase
 * @author  SGV - 20210419
 * @version 1.0 - 20210419 - initial release
 * @return  first capital letter
 */
extension CapExtension on String {
  String get inCaps => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ");
}

/// Wrapper function for [TranslationController.translate], with the option to capitalize first letter
String translate(String text, {bool capitilize = true, Locale? locale}) {
  String resultText = '';
  if (capitilize) {
    resultText = TranslationController.getInstance().translate(text, locale).inCaps;
  } else {
    resultText = TranslationController.getInstance().translate(text, locale);
  }
  return (resultText != '' && resultText != '%' ? resultText : (capitilize ? "! " + text.inCaps : "! " + text));
}




