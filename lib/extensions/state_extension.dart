part of '../widget_utils.dart';

extension StateExtension on State {
  Locale get locale => this.widget.locale;

  String l(String key, {List<String> params}) =>
      this.widget.l(key, params: params);

  /// [getWidth] is short way the calculate width by context
  double getWidth(BuildContext context, {double percent = 1}) =>
      this.widget.getWidth(context, percent: percent);

  /// [getHeight] is short way the calculate height by context
  double getHeight(BuildContext context, {double percent = 1}) =>
      this.widget.getHeight(context, percent: percent);

  /// [getFontSize] returns fonts size depends on chosen [SizeType] and detechted DeviceSize
  double getFontSize(SizeType type) => this.widget.getFontSize(type);

  /// [getIconSize] returns icon size depends on chosen [SizeType] and detechted DeviceSize
  double getIconSize(SizeType type) => this.widget.getIconSize(type);

  /// [convertSize] converts given [size] by the user device size via basic math operations.
  double convertSize(double size) => this.widget.convertSize(size);

  /// [navPush] is short way the push [widget] on route
  void navPush(BuildContext context, Widget widget) =>
      this.widget.navPush(context, widget);

  /// [navPop] is short way the pop route
  void navPop(BuildContext context) => this.widget.navPop(context);

  void doDelayedTask(Function function, {Duration duration: Duration.zero}) =>
      this.widget.doDelayedTask(function, duration: duration);

  /// [createErrorToast] show error [message] on the screen
  createErrorToast(BuildContext context, String message) =>
      this.widget.createErrorToast(context, message);

  /// [createInfoToast] show information [message] on the screen
  createInfoToast(BuildContext context, String message) =>
      this.widget.createInfoToast(context, message);

  /// [createSuccessToast] show success [message] on the screen
  createSuccessToast(BuildContext context, String message) =>
      this.createSuccessToast(context, message);

  /// [createToast] [message] by the chosen [type] on the screen
  Widget createToast(BuildContext context, String message, ToastType type) =>
      this.createToast(context, message, type);
}
