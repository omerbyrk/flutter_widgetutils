part of widget_utils;

extension WidgetExtension on Widget {
  /// [_responsiveUtils] return the instance of [ResponsiveUtils] for reponsiveness.
  ResponsiveUtils get _responsiveUtils => WidgetUtils.getResponsiveUtils();

  /// [_localizationUtils] return the instance of [LocalizationUtils] for localization.
  LocalizationUtils get _localizationUtils =>
      WidgetUtils.getLocalizationUtils();

  Locale get locale => _localizationUtils.activelocale;

  String l(String key, {List<String> params}) =>
      _localizationUtils.localize(key, params: params);

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
    return _responsiveUtils.getFontSize(type);
  }

  /// [getIconSize] returns icon size depends on chosen [SizeType] and detechted DeviceSize
  double getIconSize(SizeType type) {
    return _responsiveUtils.getIconSize(type);
  }

  /// [convertSize] converts given [size] by the user device size via basic math operations.
  double convertSize(double size) {
    return _responsiveUtils.convertToDeviceSize(size);
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

  /// [createErrorToast] show error [message] on the screen
  createErrorToast(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createError(
          message: message,
          title: 'Heyyy!',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  /// [createInfoToast] show information [message] on the screen
  createInfoToast(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createInformation(
          message: message,
          title: 'Notify',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  /// [createSuccessToast] show success [message] on the screen
  createSuccessToast(BuildContext context, String message) {
    if (message != null) {
      doDelayedTask(() {
        FlushbarHelper.createSuccess(
          message: message,
          title: 'Yeapp! :)',
          duration: Duration(seconds: 3),
        )..show(context);
      });
    }
    return Container();
  }

  /// [createToast] [message] by the chosen [type] on the screen
  Widget createToast(BuildContext context, String message, ToastType type) {
    switch (type) {
      case ToastType.SUCCESS:
        return createSuccessToast(context, message);
      case ToastType.ERROR:
        return createErrorToast(context, message);
      case ToastType.INFO:
        return createInfoToast(context, message);
      default:
        return Container();
    }
  }
}
