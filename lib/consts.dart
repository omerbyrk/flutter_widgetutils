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

class LocalizationParams {
  final List<String> langAssets;
  final Locale defLang;
  final bool logging;

  LocalizationParams(
      {@required this.langAssets, @required this.defLang, this.logging = true});
}

class ResponsiveParams {
  final bool allowTextScale;
  final bool logging;

  ResponsiveParams({this.allowTextScale = false, this.logging = true});
}
