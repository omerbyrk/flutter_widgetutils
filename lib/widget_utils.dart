library widget_utils;

import 'dart:convert';
import 'dart:ui';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'consts.dart';
part 'localization_utils.dart';
part 'responsive_utils.dart';
part 'widget_utils_builder.dart';
part 'widget_utils_exception.dart';
part 'widget_utils_extension.dart';

class WidgetUtils {
  WidgetUtils._internal();

  static ResponsiveUtils _responsiveUtils;
  static LocalizationUtils _localizationUtils;

  /// [BuildContext.onInit] inits [_responsiveUtils] object
  /// You need to run the [BuildContext.onInit] once in the appllication before using it.
  static Future<bool> init(BuildContext context,
      {ResponsiveParams responsiveParams,
      LocalizationParams localizationParams}) async {
    if (_responsiveUtils == null) {
      _responsiveUtils = ResponsiveUtils();
      _responsiveUtils.init(context, responsiveParams: responsiveParams);
      if (localizationParams != null) {
        _localizationUtils = LocalizationUtils();
        await _localizationUtils.init(context,
            localizationParams: localizationParams);
      }
      return Future.value(true);
    }
    return Future.value(true);
  }

  /// [WidgetUtils.getResponsiveUtils] return the instance of [_responsiveUtils] object.
  /// You need to init the object before using it.
  /// For the initing it, you need to use [WidgetUtils.init] method.
  static ResponsiveUtils getResponsiveUtils() {
    if (_responsiveUtils == null) {
      throw WidgetUtilsException(
          "You need to init before use the instance getScreenUtils method");
    }
    return _responsiveUtils;
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

  static log(String text, {String feature = "general"}) {
    print("WidgetUtils[$feature]:  $text");
  }
}
