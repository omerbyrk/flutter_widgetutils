part of 'widget_utils.dart';

const String language_path_regex =
    r'^([A-Za-z]:|[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*)((/[A-Za-z0-9_.-]+)+).json';

/// all the application level size type enum.
/// [SizeType] is used for detemining font, icon... vb sizes
/// Example: [WidgetUtils]
enum SizeType {
  Tiny,
  xxSmall,
  xSmall,
  Middle,
  Small,
  Large,
  xLarge,
  xxLarge,
  Ultra,
  Mega
}

enum ToastType { SUCCESS, INFO, ERROR }

extension SizeTypeToString on SizeType {
  String toStringCustom() {
    return this.toString().split(".")[1];
  }
}

class LocalizationParams {
  final List<String> langAssets;
  final Locale defLang;

  LocalizationParams({@required this.langAssets, @required this.defLang});
}

class ScreenParams {
  final bool allowTextScale;

  ScreenParams({this.allowTextScale = false});
}
