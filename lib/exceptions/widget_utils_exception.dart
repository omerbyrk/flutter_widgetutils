part of widget_utils;

abstract class WidgetUtilsException {
  factory WidgetUtilsException([var message]) => _WidgetUtilsException(message);
}

class _WidgetUtilsException implements WidgetUtilsException {
  final message;

  _WidgetUtilsException([this.message]);

  String toString() {
    if (message == null) return "WidgetUtilsException";
    return "WidgetUtilsException: " + message.toString();
  }
}
