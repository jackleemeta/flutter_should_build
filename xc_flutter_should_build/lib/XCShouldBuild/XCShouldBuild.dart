import 'package:flutter/widgets.dart';

typedef XCShouldBuildFunction<T> = bool Function(
    T oldSubstance, T newSubstance);

class XCShouldBuild<T> extends StatefulWidget {
  final T substance; // substance
  final XCShouldBuildFunction<T> xcShouldBuild;
  final WidgetBuilder builder;
  XCShouldBuild({this.substance, this.xcShouldBuild, @required this.builder})
      : assert(() {
          if (XCShouldBuild == null) {
            throw FlutterError.fromParts(<DiagnosticsNode>[
              ErrorSummary('error in XCShouldBuild: builder must exist')
            ]);
          }
          return true;
        }());
  @override
  _XCShouldBuildState createState() => _XCShouldBuildState<T>();
}

class _XCShouldBuildState<T> extends State<XCShouldBuild> {
  @override
  XCShouldBuild<T> get widget => super.widget;

  Widget oldWidget;
  T oldSubstance;

  bool _isInit = true;

  @override
  Widget build(BuildContext context) {
    final newSubstance = widget.substance;

    if (_isInit ||
        (widget.xcShouldBuild == null
            ? true
            : widget.xcShouldBuild(oldSubstance, newSubstance))) {
      _isInit = false;
      oldSubstance = newSubstance;
      oldWidget = widget.builder(context);
    }
    return oldWidget;
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("_XCShouldBuildState dispose");
  }
}
