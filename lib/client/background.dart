import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class Background extends BackgroundAudioTask {
  Background._privateConstructor();
  static final Background instance = Background._privateConstructor();

  AudioPlayer _player = AudioPlayer();

  onPlay({String item}) async {
    if (_player.playerState.playing) _player.stop();

    _player.play();
    AudioServiceBackground.setState(
      playing: true,
    );

    await _player.setUrl(item);
  }

  onStop() async {
    _player.stop();
    AudioServiceBackground.setState(
      playing: false,
    );
  }

  bool getStatus() {
    return _player.playing;
  }
}
