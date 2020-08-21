# widget_utils

An widget extension like a boilerplate which extends your app widgets with helpful functions to equip it some benefical features; such as, responsive support, mediaquery short-cuts, navigator short-cuts and so on.


## Install Library

### Add this to your package's pubspec.yaml file:

``` yml
dependencies:
  widget_utils: ^0.2.3
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

<img src="https://i.ibb.co/VSfTLkL/Screen-Shot-1442-01-02-at-15-13-24.png" width="60%" />
<img src="https://i.ibb.co/j5VSDYJ/Screen-Shot-1442-01-02-at-13-59-46.png" width="39%" />

<br />

![Iphone 11 GIF](https://media.giphy.com/media/fxfdS1vKzsK5miUVCf/giphy.gif)
![Android GIF](https://media.giphy.com/media/MZAZLd0cHbeqz8sc1t/giphy.gif)

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

__l__ method localize the given key by the localization feature.
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

## Example 
### main.dart
```dart
import 'package:flutter/material.dart';
import 'package:widget_utils/widget_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
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
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  Text createText(SizeType sizeType) {
    return Text(
      "This is " +
          sizeType.toStringCustom() +
          " text: " +
          (getFontSize(sizeType).toInt()).toString() +
          "px",
      style: TextStyle(fontSize: getFontSize(sizeType)),
    );
  }

  Icon createIcon(SizeType sizeType) {
    return Icon(
      Icons.language,
      color: Colors.blue,
      size: getIconSize(sizeType),
    );
  }

  Row createTextWithIcon(SizeType sizeType) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.home,
          size: getIconSize(sizeType),
          color: Colors.blue,
        ),
        Expanded(
          child: Text(
            sizeType.toStringCustom() + " Text and Icon",
            style: TextStyle(fontSize: getFontSize(sizeType)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text("Widget Utils Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Localization",
                  style: TextStyle(fontSize: getFontSize(SizeType.Large)),
                ),
              ),
              Center(
                child: Text(
                  l("mobile_language"),
                  style: TextStyle(fontSize: getFontSize(SizeType.Small)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Toast",
                  style: TextStyle(fontSize: getFontSize(SizeType.Large)),
                ),
              ),
              Row(
                children: [
                  RaisedButton(
                    child: Text("showToasts"),
                    onPressed: () {
                      createErrorToast(context, "Text example");
                    },
                  )
                ],
              ),
              Center(
                child: Text(
                  "Only Texts",
                  style: TextStyle(fontSize: getFontSize(SizeType.Large)),
                ),
              ),
              Divider(),
              createText(SizeType.Tiny),
              createText(SizeType.xxSmall),
              createText(SizeType.xSmall),
              createText(SizeType.Middle),
              createText(SizeType.Large),
              createText(SizeType.xLarge),
              createText(SizeType.xxLarge),
              createText(SizeType.Ultra),
              createText(SizeType.Mega),
              SizedBox(
                height: convertSize(50),
              ),
              Center(
                child: Text(
                  "Only Icons",
                  style: TextStyle(fontSize: getFontSize(SizeType.Large)),
                ),
              ),
              Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    createIcon(SizeType.Tiny),
                    createIcon(SizeType.xxSmall),
                    createIcon(SizeType.xSmall),
                    createIcon(SizeType.Small),
                    createIcon(SizeType.Middle),
                    createIcon(SizeType.Large),
                    createIcon(SizeType.xLarge),
                    createIcon(SizeType.xxLarge),
                    createIcon(SizeType.Ultra),
                    createIcon(SizeType.Mega),
                  ],
                ),
              ),
              SizedBox(
                height: convertSize(50),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      size: getIconSize(SizeType.Large),
                      color: Colors.blue,
                    ),
                    Text(
                      "Text And Icon",
                      style: TextStyle(fontSize: getFontSize(SizeType.Large)),
                    ),
                  ],
                ),
              ),
              Divider(),
              createTextWithIcon(SizeType.Tiny),
              createTextWithIcon(SizeType.xxSmall),
              createTextWithIcon(SizeType.xSmall),
              createTextWithIcon(SizeType.Middle),
              createTextWithIcon(SizeType.Large),
              createTextWithIcon(SizeType.xLarge),
              createTextWithIcon(SizeType.xxLarge),
              createTextWithIcon(SizeType.Ultra),
              createTextWithIcon(SizeType.Mega),
              SizedBox(
                height: convertSize(50),
              ),
              Center(
                  child: Text(
                "Mediaquery and Responsive padding",
                style: TextStyle(fontSize: getFontSize(SizeType.Large)),
              )),
              Divider(),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: getWidth(context, percent: 0.6),
                    height: convertSize(200),
                    padding: EdgeInsets.symmetric(
                        horizontal: convertSize(16), vertical: convertSize(8)),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "%60 width",
                                style: TextStyle(
                                    fontSize: getFontSize(SizeType.xxSmall)),
                              ),
                              Text(
                                "Padding -> h: " +
                                    convertSize(16).toInt().toString() +
                                    "px" +
                                    " v: " +
                                    convertSize(8).toInt().toString() +
                                    "px",
                                style: TextStyle(
                                    fontSize: getFontSize(SizeType.Tiny)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.yellowAccent,
                    width: getWidth(context, percent: 0.4),
                    height: convertSize(200),
                    padding: EdgeInsets.symmetric(
                        horizontal: convertSize(16), vertical: convertSize(8)),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "%40 width",
                              style: TextStyle(
                                  fontSize: getFontSize(SizeType.xxSmall)),
                            ),
                            Text(
                              "Padding -> h: " +
                                  convertSize(16).toInt().toString() +
                                  "px" +
                                  " v: " +
                                  convertSize(8).toInt().toString() +
                                  "px",
                              style: TextStyle(
                                  fontSize: getFontSize(SizeType.Tiny)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
```





