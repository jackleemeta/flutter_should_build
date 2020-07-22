# flutter_should_build

## Sumarry

- this is a way of resolving the issue of rebuilding stateful widget when a navigator is pushing or popping

- associated issue：https://github.com/flutter/flutter/issues/11655?tdsourcetag=s_pcqq_aiomsg

## Usage

1. import XCShouldBuild.dart and XCState.dart

2. make all classes of State inherit from [XCState]，do not inherit from [State]

3. override [XCState.shouldBuild]，do not override [State.build]

4. use [XCState.reload] to reload，do not use [State.setState] to reload

## Code

- scene 1：
> override [XCState.shouldBuild], it can avoid rebuilding when pushing or popping.
```

class _XCTestViewState extends XCState {

    @override
    Widget shouldBuild(BuildContext context) {
      return Center(
          child: Text("_XCTestView, if you use shouldBuild, it can avoid rebuilding when pushing or popping"));
    }
    
    void aFunc() {
      reload()
    }

}

```

- scene 2

> override [XCState.useSubstance] and  [XCState.substance],  decide for yourself whether or not to rebuild when pushing or popping.

```
class _XCTestView extends XCState {
  @override
  Widget shouldBuild(BuildContext context) {
    return Center(
        child: Text(
            "_XCTestView, if you use shouldBuild, it can avoid rebuilding when pushing or popping"));
  }

  @override
  bool useSubstance() {
    return super.useSubstance();
  }

  @override
  substance() {
    return super.substance();
  }
  
  void aFunc() {
    reload()
  }
  
}
```

