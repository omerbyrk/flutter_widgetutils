import 'package:flutter/material.dart';
import 'package:widget_utils/index.dart';

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
        responsiveParams: ResponsiveParams(allowTextScale: false),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                l("active_language"),
                style: TextStyle(fontSize: getFontSize(SizeType.Small)),
              ),
              SizedBox(
                height: convertSize(8),
              ),
              Text(
                l("localization_example",
                    params: ["${locale.languageCode}.json"]),
                style: TextStyle(fontSize: getFontSize(SizeType.xxSmall)),
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
                  createButton(context, ToastType.SUCCESS, Colors.green),
                  createButton(context, ToastType.INFO, Colors.blue),
                  createButton(context, ToastType.ERROR, Colors.red),
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
                                "Padding -> h: ${convertSize(16).toInt().toString()} px v:  ${convertSize(8).toInt().toString()} px",
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
                              "Padding -> h: ${convertSize(16).toInt().toString()} px v:  ${convertSize(8).toInt().toString()} px",
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

  Container createButton(
      BuildContext context, ToastType toastType, Color color) {
    return Container(
      margin: EdgeInsets.only(left: convertSize(5)),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(
            vertical: convertSize(8), horizontal: convertSize(5)),
        color: Colors.white70,
        child: Text(
          "${toastType.toString().split('.')[1]}",
          style:
              TextStyle(fontSize: getFontSize(SizeType.xxSmall), color: color),
        ),
        onPressed: () {
          createToast(context, "Created a $toastType example", toastType);
        },
      ),
    );
  }

  Text createText(SizeType sizeType) {
    return Text(
      "This is ${sizeType.toString().split('.')[1]}  text: ${getFontSize(sizeType).toInt().toString()} px",
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
            "${getFontSize(sizeType).toInt().toString()} Text and Icon",
            style: TextStyle(fontSize: getFontSize(sizeType)),
          ),
        ),
      ],
    );
  }
}
