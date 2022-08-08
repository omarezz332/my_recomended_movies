import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/failure.dart';

abstract class IUseCases<T,P> {
  Future<Either<Failure, T>> call(P params);
}
class NoParams {
  const NoParams();
}