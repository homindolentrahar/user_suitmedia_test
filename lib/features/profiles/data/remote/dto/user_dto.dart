import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    required String id,
    required String first_name,
    required String last_name,
    required String email,
    required String avatar,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  User toUser() {
    return User(
      id: id,
      firstName: first_name,
      lastName: last_name,
      email: email,
      avatar: avatar,
    );
  }
}
