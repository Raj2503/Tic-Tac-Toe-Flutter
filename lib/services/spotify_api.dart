import 'package:spotify_sdk/spotify_sdk.dart';

//static var _credentials = SpotifyApiCredentials(
//     '674a3c5ab1b14bfb837012985015e309',
//     'dfdbfa1f5bbc495aaf5f4d134e97247d',
//   );

class PlayMusic {
  Future<void> getAuthenticationToken() async {
    var authenticationtoken;
    try {
      authenticationtoken = await SpotifySdk.getAuthenticationToken(
          clientId: '674a3c5ab1b14bfb837012985015e309',
          redirectUrl: 'http://localhost:8888/callback/',
          scope: 'user-read-private,playlist-read-private');

      // print(authenticationtoken
      //     ? 'connect to spotify successful got authenticated'
      //     : 'connect to spotify failed not got authenticated');
    } catch (e) {}
  }

  Future<void> connectToSpotifyRemote() async {
    //Gain Remote Access to Spotify installed on User's Device.
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: '674a3c5ab1b14bfb837012985015e309',
        redirectUrl: 'http://localhost:8888/callback/',
        scope: 'user-read-private,playlist-read-private',
      );
      print(result
          ? 'connect to spotify successful'
          : 'connect to spotify failed');
    } catch (e) {
      print(e);
    }
    try {
      // await SpotifySdk.play(spotifyUri: 'spotify:track:7dlinhODpxkOVRCA8LhEGb');
      await SpotifySdk.play(
          spotifyUri: 'spotify:playlist:37i9dQZEVXbLZ52XmnySJg');
    } catch (e) {}
  }

  static Future pause() async {
    //Pause Spotify
    await SpotifySdk.pause();
  }

  static Future resume() async {
    // Play from where it was last Paused from
    await SpotifySdk.resume();
  }

  static Future stop() async {
    //Give away the access to Remote Spotify
    await SpotifySdk.disconnect();
  }
}
