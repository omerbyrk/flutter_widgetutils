library widget_utils;

import 'dart:convert';
import 'dart:ui';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'consts.dart';
part 'localization_utils.dart';
part 'screen_utils.dart';
part 'widget_utils_builder.dart';
part 'widget_utils_exception.dart';
part 'widget_utils_extension.dart';

class WidgetUtils {
  WidgetUtils._internal();

  static ScreenUtils _screenUtils;
  static LocalizationUtils _localizationUtils;

  /// [BuildContext.onInit] inits [_screenUtils] object
  /// You need to run the [BuildContext.onInit] once in the appllication before using it.
  static Future<bool> init(BuildContext context,
      {ScreenParams screenParams,
      LocalizationParams localizationParams}) async {
    if (_screenUtils == null) {
      _screenUtils = ScreenUtils();
      _screenUtils.init(context, screenParams: screenParams);
      if (localizationParams != null) {
        _localizationUtils = LocalizationUtils();
        await _localizationUtils.init(context,
            localizationParams: localizationParams);
      }
      return Future.value(true);
    }
    return Future.value(true);
  }

  /// [WidgetUtils.getScreenUtils] return the instance of [_screenUtils] object.
  /// You need to init the object before using it.
  /// For the initing it, you need to use [WidgetUtils.init] method.
  static ScreenUtils getScreenUtils() {
    if (_screenUtils == null) {
      throw WidgetUtilsException(
          "You need to init before use the instance getScreenUtils method");
    }
    return _screenUtils;
  }

  /// [WidgetUtils.getLocalizationUtils] return the instance of [_localizationUtils] object.
  /// You need to init the object before using it.
  /// For the initing it, you need to use [WidgetUtils.init] method.
  static LocalizationUtils getLocalizationUtils() {
    if (_localizationUtils == null) {
      throw WidgetUtilsException(
          "To use Localization in the app, you need to assign localizationParams to WidgetUtilsBuilder");
    }
    return _localizationUtils;
  }
}
