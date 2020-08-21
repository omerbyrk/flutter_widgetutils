part of 'widget_utils.dart';

extension WidgetUtilsExtension on Widget {
  /// [_widgetUtils] return the instance of [ScreenUtils] for reponsiveness.
  WidgetUtils get _widgetUtils => WidgetUtils.instance();

  /// [getWidth] is short way the calculate width by context
  double getWidth(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.width * percent;
  }

  /// [getHeight] is short way the calculate height by context
  double getHeight(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.height * percent;
  }

  /// [getFontSize] returns fonts size depends on chosen [SizeType] and detechted DeviceSize
  double getFontSize(SizeType type) {
    return _widgetUtils.getFontSize(type);
  }

  /// [getIconSize] returns icon size depends on chosen [SizeType] and detechted DeviceSize
  double getIconSize(SizeType type) {
    return _widgetUtils.getIconSize(type);
  }

  /// [convertSize] converts given [size] by the user device size via basic math operations.
  double convertSize(double size) {
    return _widgetUtils.convertToDeviceSize(size);
  }

  /// [navPush] is short way the push [widget] on route
  void navPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  /// [navPop] is short way the pop route
  void navPop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void doDelayedTask(Function function, {Duration duration: Duration.zero}) {
    if (function == null) return;

    Future.delayed(duration, function);
  }
}
