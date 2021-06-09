import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/services/provider.dart';
import 'package:tic_tac_toe/services/sound.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final soundService = locator<SoundService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: soundService.enableSound$,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          final bool isSoundEnabled = snapshot.data;

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Enable Sound",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Expanded(child: Container()),
                        CupertinoSwitch(
                          onChanged: (e) {
                            soundService.enableSound$.add(e);
                            soundService.pauseSpotify();
                          },
                          value: isSoundEnabled,
                          activeColor: MyTheme.blue,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
