part of 'widget_utils.dart';

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

extension SizeTypeToString on SizeType {
  String toStringCustom() {
    return this.toString().split(".")[1];
  }
}
