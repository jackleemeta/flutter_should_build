import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../XCShouldBuild/XCState.dart';
import 'XCTestView1.dart';

class XCTestView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _XCTestView();
}

class _XCTestView extends XCState {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return XCTestView1();
      }));
    });
  }

  @override
  Widget shouldBuild(BuildContext context) {
    return Center(
        child: Text(
            "_XCTestView, if you use shouldBuild, it can avoid rebuilding when pushing or popping"));
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("_XCTestView dispose");
  }
}
