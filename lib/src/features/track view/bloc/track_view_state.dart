part of 'track_view_bloc.dart';

@immutable
abstract class TrackViewState {}

class TrackViewInitial extends TrackViewState {}

class LoadingInfo extends TrackViewState {}

class ErrorInInfo extends TrackViewState {
  final String error;
  ErrorInInfo(this.error);
}

class InfoReady extends TrackViewState {
  final Track track;
  InfoReady(this.track);
}
