import 'package:dartz/dartz.dart';
import 'package:user_suitmedia_test/common/error/app_error.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';

abstract class IUserRepository {
  Future<Either<AppError, List<User>>> getAllUser({
    required int page,
    int perPage,
  });
}
