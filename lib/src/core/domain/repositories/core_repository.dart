import 'package:dartz/dartz.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/utils/failures.dart';

abstract class CoreRepository {
  Future<Either<Failure, bool>> getSession();
  Future<Either<Failure, List<Track>>> searchTracks(
      {required String query, required int page});
  Future<Either<Failure, Track>> getTrackInfo(
      {String? trackId, String? trackName, String? artistName});
}
