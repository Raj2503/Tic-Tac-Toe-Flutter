import 'package:rxdart/rxdart.dart';
import 'package:tic_tac_toe/services/spotify_api.dart';
import 'package:tic_tac_toe/services/stoppable_service.dart';

class SoundService extends StoppableService {
  //To control the music serivces when is minized or closed.
  BehaviorSubject<bool> _enableSound$;
  BehaviorSubject<bool> get enableSound$ => _enableSound$;

  SoundService() {
    _enableSound$ = BehaviorSubject<bool>.seeded(true);
  }

  @override
  void start() {
    super.start();
    PlayMusic.resume();
    // print('SoundService Started');
  }

  @override
  void stop() {
    super.stop();
    PlayMusic.pause();
    // print('SoundService Stopped');
  }

  playSpotify() {
    //Connect to Spotify
    PlayMusic().connectToSpotifyRemote();
  }

  pauseSpotify() {
    //Pause or Play Music based on Enable Switch in Settings
    bool isSoundEnabled = _enableSound$.value;
    if (!isSoundEnabled) {
      PlayMusic.pause();
    } else {
      PlayMusic.resume();
    }
  }
}
