import 'package:flutter/widgets.dart';
import 'XCShouldBuild.dart';

/// ## Sumarry

/// - this is a way of resolving the issue of rebuilding stateful widget when a navigator is pushing or popping

/// - associated issue：https://github.com/flutter/flutter/issues/11655?tdsourcetag=s_pcqq_aiomsg

///  ## Usage

/// 1. import XCShouldBuild.dart and XCState.dart

/// 2. make all classes of State inherit from [XCState]，do not inherit from [State]

/// 3. override [XCState.shouldBuild]，do not override [State.build]

/// 4. use [XCState.reload] to reload，do not use [State.setState] to reload
abstract class XCState<T> extends State {
  bool _isShouldBuild = false;

  @override
  Widget build(BuildContext context) {
    bool willUseSubstance = useSubstance();

    return XCShouldBuild<T>(
        substance: willUseSubstance ? substance() : null,
        shouldBuildFunction: (oldSubstance, newSubstance) {
          bool willReload;
          if (_isShouldBuild) {
            willReload = true;
          } else {
            if (willUseSubstance) {
              willReload = oldSubstance != newSubstance;
            } else {
              willReload = false;
            }
          }
          return willReload;
        },
        builder: (BuildContext context) {
          _isShouldBuild = false;
          return shouldBuild(context);
        });
  }

  Widget shouldBuild(BuildContext context);

  bool useSubstance() => false;

  T substance() => null;

  void reload([VoidCallback fn]) {
    if (!mounted) return;
    setState(() {
      _isShouldBuild = true;
      if (fn != null) {
        fn();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("XCState dispose");
  }
}
