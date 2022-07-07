import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;

  UserSuccess(this.users);
}

class UserLoading extends UserState {
  final List<User> oldUsers;
  final bool isFirstFetch;

  UserLoading(this.oldUsers, {this.isFirstFetch = false});
}
