import 'package:flutter/material.dart';
import 'package:tic_tac_toe/services/provider.dart';
import 'package:tic_tac_toe/services/stoppable_service.dart';
import 'package:tic_tac_toe/services/sound.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  //Monitor the AppLifeCycle Constantly
  List<StoppableService> servicesToManager = [
    locator<SoundService>(),
  ]; //loop through all the services to stop/resume them
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print('state = $state');
    super.didChangeAppLifecycleState(state);
    servicesToManager.forEach((service) {
      if (state == AppLifecycleState.resumed) //app is opened again
        service.start();
      else
        service.stop(); //remain dormant
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
