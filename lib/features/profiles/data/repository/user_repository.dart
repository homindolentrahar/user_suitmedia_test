import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:user_suitmedia_test/common/error/app_error.dart';
import 'package:user_suitmedia_test/features/profiles/data/remote/api_contracts.dart';
import 'package:user_suitmedia_test/features/profiles/data/remote/dto/user_dto.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';
import 'package:user_suitmedia_test/features/profiles/domain/repository/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final Dio _dio;

  UserRepository({required Dio dio}) : _dio = dio;

  @override
  Future<Either<AppError, List<User>>> getAllUser({
    required int page,
    int perPage = 6,
  }) async {
    try {
      final response = await _dio.get(
        ApiContracts.usersEndpoint,
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final users = (data['data'] as List<dynamic>)
            .map((user) => UserDto.fromJson(user))
            .toList();

        return right(users.map((user) => user.toUser()).toList());
      } else {
        throw Exception("Cannot load Users");
      }
    } on Exception catch (e) {
      return left(AppError(e.toString()));
    }
  }
}
