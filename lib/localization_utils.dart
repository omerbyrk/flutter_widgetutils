part of 'widget_utils.dart';

class LocalizationUtils {
  BuildContext context;
  LocalizationParams localizationParams;
  Locale deviceLocale;
  Map<String, String> _localizedStrings;

  Future<void> init(BuildContext context,
      {@required LocalizationParams localizationParams}) async {
    this.context = context;
    this.localizationParams = localizationParams;
    _validateLocalizationParams();
    deviceLocale = window.locale ?? localizationParams.defLang;
    _log("language: ${activelocale.languageCode}");
    await _loadActiveLocaleLangAsset();
  }

  /// localize the key from the [_localizedStrings].
  /// If not fount, then print it to notify you.
  String localize(String key, {List<String> params}) {
    String localizedString = _localizedStrings[key];
    if (params != null) {
      for (var i = 0; i < params.length; i++) {
        var param = params[i];
        localizedString = localizedString.replaceFirst("{$i}", param);
      }
    }

    if (localizedString == null) {
      _log("$key -> not fount[maybe the cache problems]");
    }
    return localizedString ?? key;
  }

  Future<void> _loadActiveLocaleLangAsset() async {
    _log("language asset: $_langAssetOfActiveLocale");
    String jsonString = await rootBundle.loadString(_langAssetOfActiveLocale);
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    _log("total localized key: ${jsonMap.length}");
    _log(
        "If you change the ${_getFileName(_langAssetOfActiveLocale)} file and the application was'nt affected, there can be cache problems so you need to restart the application ");
  }

  String get _langAssetOfActiveLocale {
    for (var filePath in localizationParams.langAssets) {
      String jsonFileName = _getFileName(filePath);
      String localeFileName = activelocale.languageCode + ".json";

      if (jsonFileName == localeFileName) return filePath;
    }
    throw WidgetUtilsException(
        "Language Json Path can't found for the language " +
            activelocale.languageCode);
  }

  /// [locale] return the deviceLocale If device locale is a supported language
  /// If not, returns defaultLanguage
  Locale get activelocale {
    if (_isSupportedLanguage(deviceLocale)) {
      return deviceLocale;
    } else {
      return localizationParams.defLang;
    }
  }

  /// If there is a [localizationParams.langAssets] about the [locale], then returns true
  bool _isSupportedLanguage(Locale locale) {
    for (var filePath in localizationParams.langAssets) {
      String jsonFileName = _getFileName(filePath);
      String localeFileName = locale.languageCode + ".json";

      if (jsonFileName == localeFileName) return true;
    }
    return false;
  }

  String _getFileName(String filePath) {
    return (filePath.split('/').last);
  }

  /// Validate the [LocalizationParams] object.
  /// If it isn't valid, then throws [WidgetUtilsException] exception.
  void _validateLocalizationParams() {
    if (localizationParams.defLang == null) {
      throw WidgetUtilsException("defLang can't be null");
    }

    if (localizationParams.langAssets == null) {
      throw WidgetUtilsException("langAssets can't be null");
    }

    for (var filePath in localizationParams.langAssets) {
      if (!RegExp(language_path_regex).hasMatch(filePath)) {
        throw WidgetUtilsException("langAssets can't be " +
            filePath +
            ". The example language path is assets/lang/en.json");
      }
    }
  }

  void _log(String text) {
    if (localizationParams.logging)
      WidgetUtils.log(text, feature: "localization");
  }
}
