import 'package:flutter/widgets.dart';
import '../XCShouldBuild/XCState.dart';

class XCTestView1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _XCTestView1State();
}

class _XCTestView1State extends XCState {
  @override
  Widget shouldBuild(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
                "_XCTestView1, if you use `shouldBuild`, it can avoid rebuilding when pushing or popping")));
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("_XCTestView1State dispose");
  }
}
