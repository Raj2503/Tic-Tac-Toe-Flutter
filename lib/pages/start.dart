import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/btn.dart';
import 'package:tic_tac_toe/pages/game.dart';
import 'package:tic_tac_toe/pages/pick.dart';
import 'package:tic_tac_toe/pages/settings.dart';
import 'package:tic_tac_toe/services/alert.dart';
import 'package:tic_tac_toe/services/board.dart';
import 'package:tic_tac_toe/services/provider.dart';
import 'package:tic_tac_toe/services/sound.dart';
import 'package:tic_tac_toe/services/spotify_api.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class StartPage extends StatelessWidget {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();

  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [0.5, 0.5],
              colors: [
                MyTheme.red,
                MyTheme.blue,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Tic Tac Toe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'DancingScript'),
                    ),
                    Image(
                      image: AssetImage('./images/logo2.png'),
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Btn(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PickPage(),
                          ),
                        );
                      },
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      color: Colors.white,
                      child: Text(
                        "single player".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 30),
                    Btn(
                      onTap: () {
                        soundService.playSpotify();
                      },
                      color: Colors.white,
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      child: Text(
                        "Play Music".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 60),
                    Btn(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 50,
                      width: 50,
                      borderRadius: 25,
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
