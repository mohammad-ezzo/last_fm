import 'package:dartz/dartz.dart';
import 'package:last_fm/src/core/data/datasources/lastfm_api.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/domain/repositories/core_repository.dart';
import 'package:last_fm/src/core/utils/exceptions.dart';
import 'package:last_fm/src/core/utils/failures.dart';

class CoreRepositoryImpl implements CoreRepository {
  final LastfmApi lastfmApi;
  CoreRepositoryImpl(this.lastfmApi);
  @override
  Future<Either<Failure, bool>> getSession() async {
    try {
      final result = await lastfmApi.getSession();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Track>> getTrackInfo(
      {String? trackId, String? trackName, String? artistName}) async {
    try {
      final result =
          await lastfmApi.getTrackInfo(trackId, trackName, artistName);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Track>>> searchTracks(
      {required String query, required int page}) async {
    try {
      final result = await lastfmApi.searchTrack(query, page);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
