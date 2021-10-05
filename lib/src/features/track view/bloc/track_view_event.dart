part of 'track_view_bloc.dart';

@immutable
abstract class TrackViewEvent {}

class GetTrackInfoEvent extends TrackViewEvent {
  final String? trackId;
  final String? trackName;
  final String? artistName;
  GetTrackInfoEvent(this.trackId, this.trackName, this.artistName);
}
