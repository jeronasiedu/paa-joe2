import 'package:just_audio/just_audio.dart';
import 'package:planttech_2/translate/translations.dart';

class MyAudioPlayer {
  final _player = AudioPlayer();
  late String _audioUrl;
  Future<void> play({required String type, required Languages lang}) async {
    // early blight
    if (type == 'early blight' && lang == Languages.twi) {
      _audioUrl = earlyBlightTwiAudio;
    } else if (type == 'early blight' && lang == Languages.ga) {
      _audioUrl = earlyBlightGaAudio;
    }
    // late blight
    else if (type == 'late blight' && lang == Languages.twi) {
      _audioUrl = lateBlightTwiAudio;
    } else if (type == 'late blight' && lang == Languages.ga) {
      _audioUrl = lateBlightGaAudio;
    }
    //  healthy
    else if (type == 'healthy' && lang == Languages.twi) {
      _audioUrl = healthyTwiAudio;
    } else {
      _audioUrl = healthyGaAudio;
    }

    try {
      _player.stop();
      await _player.setAsset(_audioUrl);
      await _player.play();
    } on PlayerException catch (e) {
      print(e.message);
    }
  }

  // kill the player when the app is closed
  void kill() {
    _player.dispose();
  }
}
