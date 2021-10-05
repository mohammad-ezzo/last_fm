import 'package:dartz/dartz.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/domain/repositories/core_repository.dart';
import 'package:last_fm/src/core/utils/failures.dart';
import 'package:last_fm/src/core/utils/usecase.dart';

class SearchTracks extends UseCase<List<Track>, SearchTrackParams> {
  final CoreRepository repository;

  SearchTracks(
    this.repository,
  );
  @override
  Future<Either<Failure, List<Track>>> call(SearchTrackParams params) async {
    return await repository.searchTracks(
        query: params.query, page: params.page);
  }
}

class SearchTrackParams {
  final String query;
  final int page;
  SearchTrackParams(this.query, this.page);
}
