import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/domain/usecases/track/get_track_info.dart';
import 'package:last_fm/src/injections.dart';
import 'package:meta/meta.dart';
part 'track_view_event.dart';
part 'track_view_state.dart';

class TrackViewBloc extends Bloc<TrackViewEvent, TrackViewState> {
  TrackViewBloc() : super(TrackViewInitial());
  @override
  Stream<TrackViewState> mapEventToState(
    TrackViewEvent event,
  ) async* {
    if (event is GetTrackInfoEvent) {
      yield LoadingInfo();
      final result = await sl<GetTrackInfo>().call(GetTrackInfoParams(
          trackId: event.trackId,
          trackName: event.trackName,
          artistName: event.artistName));
      yield result.fold((l) {
        return ErrorInInfo(l.errorMessage);
      }, (r) {
        return InfoReady(r);
      });
    }
  }
}
