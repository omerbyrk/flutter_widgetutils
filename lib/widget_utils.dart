library widget_utils;

import 'dart:ui';

import 'package:flutter/material.dart';

part 'enums.dart';
part 'widget_utils_exception.dart';
part 'widget_utils_extension.dart';

/// [ScreenUtils] is a library for the responsiveness.
/// [ScreenUtils] converts font, icon, padding size across devices to get responsiveness.
/// I adjusted the [_deviceSizeRateMultipliers] and [_fontOrFontSizeRateMultipliers] values but they may  not performs well in every situations.
/// Example: [AppWidgetExtension]
class WidgetUtils {
  SizeType deviceSize;
  BuildContext context;
  double textScaleFactor = 1.0;

  /// The singleton widgetUtils object.
  static WidgetUtils widgetUtils = null;

  WidgetUtils._internal(); // private constructor

  /// If you would change it and get positive result, please push it to our repository for improving the boilerplate!
  Map<SizeType, double> _deviceSizeRateMultipliers = {
    SizeType.xxSmall: 0.70,
    SizeType.xSmall: 0.80,
    SizeType.Small: 0.83,
    SizeType.Middle: 0.85,
    SizeType.Large: 0.90,
    SizeType.xLarge: 0.95,
    SizeType.xxLarge: 1.00,
    SizeType.Ultra: 1.15,
    SizeType.Mega: 1.50
  };

  /// If you would change it and get positive result, please push it to our repository for improving the boilerplate!
  Map<SizeType, double> _fontOrFontSizeRateMultipliers = {
    SizeType.Tiny: 1.15,
    SizeType.xxSmall: 1.25,
    SizeType.xSmall: 1.30,
    SizeType.Small: 1.35,
    SizeType.Middle: 1.37,
    SizeType.Large: 1.40,
    SizeType.xLarge: 1.43,
    SizeType.xxLarge: 1.45,
    SizeType.Ultra: 1.47,
    SizeType.Mega: 1.50
  };

  Map<SizeType, double> _deviceFontSizes = {
    SizeType.Tiny: 10,
    SizeType.xxSmall: 12,
    SizeType.xSmall: 14,
    SizeType.Small: 16,
    SizeType.Middle: 18,
    SizeType.Large: 20,
    SizeType.xLarge: 22,
    SizeType.xxLarge: 24,
    SizeType.Ultra: 26,
    SizeType.Mega: 35
  };

  Map<SizeType, double> _deviceIconSizes = {
    SizeType.Tiny: 12,
    SizeType.xxSmall: 16,
    SizeType.xSmall: 18,
    SizeType.Small: 20,
    SizeType.Middle: 22,
    SizeType.Large: 24,
    SizeType.xLarge: 26,
    SizeType.xxLarge: 28,
    SizeType.Ultra: 28,
    SizeType.Mega: 37
  };

  /// [WidgetUtils.init] inits [widgetUtils] object
  /// You need to run the [WidgetUtils.init] once in the appllication before using it.
  factory WidgetUtils.init(
      {@required BuildContext context, bool allowTextScale = false}) {
    if (widgetUtils == null) {
      widgetUtils = new WidgetUtils._internal();
      widgetUtils.init(context: context, allowTextScale: allowTextScale);
    }
    return widgetUtils;
  }

  /// [WidgetUtils.instance] return the instance of [widgetUtils] object.
  /// You need to init the object before using it.
  /// For the initing it, you need to use [WidgetUtils.init] method.
  factory WidgetUtils.instance() {
    if (widgetUtils == null) {
      throw WidgetUtilsException(
          "You need to init before use the instance method");
    }
    return widgetUtils;
  }

  void init({@required BuildContext context, bool allowTextScale = false}) {
    this.context = context;
    _detechDeviceSize();
    if (!allowTextScale) {
      this.textScaleFactor = MediaQuery.of(context).textScaleFactor;
    }
  }

  _detechDeviceSize() {
    double width = window.physicalSize.width;
    double height = window.physicalSize.height;

    if (width <= 240) {
      deviceSize = SizeType.xxSmall;
    } else if (width <= 360) {
      deviceSize = SizeType.xSmall;
    } else if (width <= 480) {
      deviceSize = SizeType.Small;
    } else if (width <= 540) {
      deviceSize = SizeType.Middle;
    } else if (width <= 720) {
      deviceSize = SizeType.Large;
    } else if (width <= 900) {
      deviceSize = SizeType.xLarge;
    } else if (width <= 1080) {
      deviceSize = SizeType.xxLarge;
    } else if (width <= 1440) {
      deviceSize = SizeType.Ultra;
    } else {
      deviceSize = SizeType.Mega;
    }
    print(width.toString() +
        " " +
        height.toString() +
        " -> " +
        deviceSize.toString());
    debugPrint(width.toString() +
        " " +
        height.toString() +
        " -> " +
        deviceSize.toString());
  }

  get _sizeFontMultiplier {
    if (deviceSize == null) {
      deviceSize = SizeType.Middle;
    }
    return textScaleFactor * _fontOrFontSizeRateMultipliers[deviceSize];
  }

  get _deviceSizeMultiplier {
    if (deviceSize == null) {
      deviceSize = SizeType.Mega;
    }
    return _deviceSizeRateMultipliers[deviceSize];
  }

  double getIconSize(SizeType type) {
    return this.convertToDeviceSize(_deviceIconSizes[type]) *
        _fontOrFontSizeRateMultipliers[deviceSize];
  }

  double getFontSize(SizeType type) {
    return this.convertToDeviceSize(_deviceFontSizes[type]) *
        _sizeFontMultiplier;
  }

  double convertToDeviceSize(double size) {
    return size * _deviceSizeMultiplier;
  }
}
