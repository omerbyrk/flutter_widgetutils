# widget_utils

An widget extension like a boilerplate which extends your app widgets with helpful functions to equip it some benefical features; such as, responsive support, mediaquery short-cuts, navigator short-cuts and so on.


## Install Library

### Add this to your package's pubspec.yaml file:

``` yml
dependencies:
  widget_utils: ^0.2.4
```

### Run the code to install package

`$ flutter pub get`

### Import the library

`import 'package:widget_utils/widget_utils.dart';`



## Features
* Responsive support
* Localization support
* Mediaquery shortcuts
* Navigator shortcuts
* Toast shortcuts

## Screens

Responsive widgets(text/icons/image...) that compatible on every device
<br />

![Screen Shot](https://i.ibb.co/zfNxXGn/Screen-Shot-1442-01-03-at-09-35-15.png)

<br />

![Screen Record](https://media.giphy.com/media/iFyzu1ZgQvji7Qbtaf/giphy.gif)


<br />

## To initiate library
You need to use WidgetUtilsBuilder component inside MaterialApp.
If you want the localization feature, then specify the lang json assets and default language by assign the localizationParams prop.
```dart
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetUtilsBuilder(
        screenParams: ScreenParams(allowTextScale: false),
        localizationParams: LocalizationParams(
            defLang: Locale("en", "US"),
            langAssets: ["assets/lang/en.json", "assets/lang/tr.json"]),
        builder: (_) {
          return HomePage(
            title: "Widget Utils Demo Project",
          );
        },
      ),
    );
  }
```


## Functions
__SizeType__ enum is used for detemining __font__, __icon__... vb size types.
```dart
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
```

__l__ method localize the given key by the localization json file.
```dart
String l(String key, {List<String> params}) =>
    _localizationUtils.localize(key, params: params);
```


__getHeight__ is short way the calculate height by context
```dart
  double getHeight(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.height * percent;
  }
```

__getWidth__ is short way the calculate width by context
```dart
  double getWidth(BuildContext context, {double percent = 1}) {
    return MediaQuery.of(context).size.width * percent;
  }
```

__getFontSize__ method accepts the __SizeType__ parameter, and return the size according to the __Parameter__ 
```dart
  double getFontSize(SizeType sizeType) {
    return _widgetUtils.getFontSize(sizeType);
  }
```

__getIconSize__ method accept the __SizeType__ parameter, and return the size according to the __Parameter__ 
```dart
  double getIconSize(SizeType sizeType) {
    return _widgetUtils.getIconSize(sizeType);
  }
```

__convertSize__ converts given __size__ by the user device size via basic math operations. You can use it __height__, __weight__ or __padding__ sizes.
```dart
  double convertSize(double size) {
    return _widgetUtils.convertToDeviceSize(size);
  }
```

__navPush__ is short way the push __widget__ on the route.
```dart
void navPush(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => widget),
  );
}
```

__navPop__ is short way the pop route
```dart
void navPop(BuildContext context) {
  Navigator.of(context).pop();
}
```

__doDelayedTask__ run the code after some minute...
```dart
void doDelayedTask(Function function, {Duration duration: Duration.zero}) {
  if (function == null) return;

  Future.delayed(duration, function);
}
```

### __Toast__ functions

```dart

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
```







