import 'package:dartz/dartz.dart';
import 'package:last_fm/src/core/domain/repositories/core_repository.dart';
import 'package:last_fm/src/core/utils/failures.dart';
import 'package:last_fm/src/core/utils/usecase.dart';

class GetPageDetails extends UseCase<bool, NoParams> {
  final CoreRepository repository;

  GetPageDetails(
    this.repository,
  );
  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await repository.getSession();
  }
}
