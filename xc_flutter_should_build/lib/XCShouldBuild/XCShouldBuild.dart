import 'package:flutter/widgets.dart';

typedef XCShouldBuildFunction<T> = bool Function(
    T oldSubstance, T newSubstance);

class XCShouldBuild<T> extends StatefulWidget {
  final T substance; // substance
  final XCShouldBuildFunction<T> shouldBuildFunction;
  final WidgetBuilder builder;
  XCShouldBuild(
      {this.substance, this.shouldBuildFunction, @required this.builder})
      : assert(() {
          if (builder == null) {
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
  Widget oldWidget;
  T oldSubstance;

  bool _isInit = true;

  @override
  Widget build(BuildContext context) {
    final newSubstance = widget.substance;

    if (_isInit ||
        (widget.shouldBuildFunction == null
            ? true
            : widget.shouldBuildFunction(oldSubstance, newSubstance))) {
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
