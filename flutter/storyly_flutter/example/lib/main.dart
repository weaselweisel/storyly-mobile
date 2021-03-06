import 'package:flutter/material.dart';
import 'package:storyly_flutter/storyly_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StorylyViewController storylyViewController;

  @override
  void initState() {
    super.initState();
  }

  void onStorylyViewCreated(StorylyViewController storylyViewController) {
    this.storylyViewController = storylyViewController;
    // You can call any function after this.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 130,
          child: StorylyView(
            onStorylyViewCreated: onStorylyViewCreated,
            androidParam: StorylyParam()
            ..storylyId = YOUR_APP_ID_FROM_DASHBOARD,
            iosParam: StorylyParam()
            ..storylyId = YOUR_APP_ID_FROM_DASHBOARD,
            storylyLoaded: (storyGroupList) => print("storylyLoaded"),
            storylyLoadFailed: (errorMessage) => print("storylyLoadFailed"),
            storylyActionClicked: (story) => print("storylyActionClicked"),
            storylyStoryShown: () => print("storylyStoryShown"),
            storylyStoryDismissed: () => print("storylyStoryDismissed"),
            storylyUserInteracted: (eventPayload) => print("storylyUserInteracted")
          ),
        ),
      ),
    );
  }
}
