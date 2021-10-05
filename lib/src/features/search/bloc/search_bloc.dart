import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/domain/usecases/track/search_tracks.dart';
import 'package:meta/meta.dart';

import '../../../injections.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  int page = 1;
  SearchBloc() : super(SearchInitial());
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is GetSearchResult) {
      yield LoadingResults();
      page = 1;
      final result =
          await sl<SearchTracks>().call(SearchTrackParams(event.query, page));
      yield result.fold((l) {
        return ErrorInSearch(l.errorMessage);
      }, (r) {
        page++;
        return ResultReady(result: r, hasReachedMax: r.isEmpty,);
      });
    } else if (event is GetMoreSearchResult &&
        (state is ResultReady && !(state as ResultReady).hasReachedMax)) {
      final result =
          await sl<SearchTracks>().call(SearchTrackParams(event.query, page));
      yield result.fold((l) {
        return ErrorInSearch(l.errorMessage);
      }, (r) {
        page++;
        return ResultReady(
            result: (state as ResultReady).result + r,
            hasReachedMax: r.isEmpty);
      });
    }
  }
}
