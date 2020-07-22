import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../XCShouldBuild/XCState.dart';
import 'XCTestView1.dart';

class XCUseSubstanceTestView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _XCUseSubstanceTestViewState();
}

class _XCUseSubstanceTestViewState extends XCState {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      _aCountAsSubstance++;
    });

    Future.delayed(Duration(seconds: 20), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return XCTestView1();
      }));
    });

    Future.delayed(Duration(seconds: 30), () {
      Navigator.pop(context);
    });
  }

  /// After [_aCountAsSubstance] changed and [XCState.reload] called, [_XCUseSubstanceTestViewState.shouldBuild] will be called.
  var _aCountAsSubstance = 0;

  @override
  Widget shouldBuild(BuildContext context) {
    return Center(
        child: Text(
            "_XCUseSubstanceTestView, if you use `shouldBuild`, it can avoid rebuilding when pushing or popping, _aCountAsSubstance = $_aCountAsSubstance "));
  }

  @override
  bool useSubstance() {
    return true;
  }

  @override
  substance() {
    return _aCountAsSubstance;
  }

  /// After [_aCountAsSubstance] changed and [XCState.reload] called, [_XCUseSubstanceTestViewState.shouldBuild] will be called.
  void aFunc() {
    // _aCountAsSubstance++;
    reload();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("XCUseSubstanceTestView dispose");
  }
}
