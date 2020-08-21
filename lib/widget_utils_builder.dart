part of 'widget_utils.dart';

/// Initiate [WidgetUtils] apps with given params [screenParams], [localizationParams].
/// After the initiate is completed, run the builder function
class WidgetUtilsBuilder extends StatelessWidget {
  final ScreenParams screenParams;
  final LocalizationParams localizationParams;
  final Widget Function(BuildContext) builder;

  const WidgetUtilsBuilder(
      {Key key,
      this.screenParams,
      this.localizationParams,
      @required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: WidgetUtils.init(context,
          screenParams: screenParams, localizationParams: localizationParams),
      builder: (_, snapshot) {
        if (snapshot.error != null)
          throw new WidgetUtilsException(snapshot.error);

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return builder(context);
      },
    );
  }
}
