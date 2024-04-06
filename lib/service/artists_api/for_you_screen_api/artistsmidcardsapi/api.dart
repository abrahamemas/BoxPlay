import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class ApiService {
  ApiService();

  Future<List<PlaylistType>> fetchTracks() async {
    const url =
        'https://corsproxy.io/?https://api.deezer.com/playlist/5411628342';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final List<dynamic> tracksJson = json['tracks']['data'] ?? [];
    final List<PlaylistType> tracks = tracksJson.map((trackJson) {
      return PlaylistType.fromJson(trackJson);
    }).toList();

    return tracks;
  }
}

final fetchTracksProvider = Provider<ApiService>((ref) => ApiService());

final fetchTracksDataProvider = FutureProvider<List<PlaylistType>>((ref) async {
  final apiService = ref.read(fetchTracksProvider);
  return apiService.fetchTracks();
});

class SelectedTrackNotifier extends StateNotifier<PlayListItemType?> {
  double _duration = 1;
  int _currentIndex = 0;
  List<PlaylistType>? _tracks;
  final AudioPlayer _audioPlayer;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  double get duration => _duration;

  SelectedTrackNotifier(this._audioPlayer) : super(null) {
    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        moveToNextTrack();
      }
    });
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    super.dispose();
  }

  void setDuration(double duration) {
    _duration = duration;
  }

  void setSelectedTrack(
      PlayListItemType selectedTrack, List<PlaylistType> tracks) {
    _duration = selectedTrack.duration.toDouble();
    state = selectedTrack;
    _tracks = tracks;
  }

  Future<void> moveToNextTrack() async {
    if (_tracks != null && _currentIndex < _tracks!.length - 1) {
      _currentIndex++;
      final selectedTrack = _tracks![_currentIndex].tracks.data;
      setSelectedTrack(selectedTrack, _tracks!);
      await _playTrack(selectedTrack.preview);
    } else {
      await stop();
    }
  }

  Future<void> moveToPreviousTrack() async {
    if (_tracks != null && _currentIndex > 0) {
      _currentIndex--;
      final selectedTrack = _tracks![_currentIndex].tracks.data;
      setSelectedTrack(selectedTrack, _tracks!);
      await _playTrack(selectedTrack.preview);
    }
  }

  Future<void> _playTrack(String audioUrl) async {
    await _audioPlayer.stop();

    await _audioPlayer.play(
      UrlSource(audioUrl),
    );
  }

  List<PlayListItemType> getUpcomingSongs() {
    if (_tracks == null || _currentIndex >= _tracks!.length - 1) {
      return [];
    }
    return _tracks!
        .sublist(_currentIndex + 1)
        .map((playlistType) => playlistType.tracks.data)
        .toList();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }
}

final selectedTrackProvider =
    StateNotifierProvider<SelectedTrackNotifier, PlayListItemType?>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  return SelectedTrackNotifier(audioPlayer);
});

final audioPlayerProvider = Provider<AudioPlayer>((ref) {
  return AudioPlayer();
});

final playPauseProvider = StateNotifierProvider<PlayPauseNotifier, bool>((ref) {
  return PlayPauseNotifier(
    ref.read(audioPlayerProvider),
  );
});

class PlayPauseNotifier extends StateNotifier<bool> {
  final AudioPlayer _audioPlayer;

  PlayPauseNotifier(
    this._audioPlayer,
  ) : super(false);

  Future<void> togglePlayPause(String audioUrl) async {
    if (state) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(
        UrlSource(audioUrl),
      );
    }
    state = !state;
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    state = false;
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitMinutes:$twoDigitSeconds';
}
