import 'package:dartz/dartz.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/domain/repositories/core_repository.dart';
import 'package:last_fm/src/core/utils/failures.dart';
import 'package:last_fm/src/core/utils/usecase.dart';

class GetTrackInfo extends UseCase<Track, GetTrackInfoParams> {
  final CoreRepository repository;

  GetTrackInfo(
    this.repository,
  );
  @override
  Future<Either<Failure, Track>> call(GetTrackInfoParams params) async {
    return await repository.getTrackInfo(
        trackId: params.trackId,
        trackName: params.trackName,
        artistName: params.artistName);
  }
}

class GetTrackInfoParams {
  final String? trackId;
  final String? trackName;
  final String? artistName;
  GetTrackInfoParams({this.trackId, this.artistName, this.trackName});
}
