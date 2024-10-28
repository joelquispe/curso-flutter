import 'package:flutter/material.dart';

class AppLifeCycleScreen extends StatefulWidget {
  const AppLifeCycleScreen({super.key});

  @override
  State<AppLifeCycleScreen> createState() => _AppLifeCycleScreenState();
}

class _AppLifeCycleScreenState extends State<AppLifeCycleScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.inactive == state) {
      print("inactive");
    } else if (AppLifecycleState.paused == state) {
      print("paused");
    } else if (AppLifecycleState.resumed == state) {
      print("resumed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Ig: yoecode"),
      ),
    );
  }
}
