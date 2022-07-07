import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';
import 'package:user_suitmedia_test/features/profiles/domain/repository/i_user_repository.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/application/user_state.dart';

class UserWatcher extends Cubit<UserState> {
  final IUserRepository _userRepository;
  int page = 1;

  UserWatcher(this._userRepository) : super(UserInitial());

  Future<void> getAllUsers() async {
    if (state is UserLoading) {
      return;
    }

    final currentState = state;

    var oldUsers = <User>[];

    if (currentState is UserSuccess) {
      oldUsers = currentState.users;
    }

    emit(UserLoading(oldUsers, isFirstFetch: page == 1));

    final result = await _userRepository.getAllUser(page: page, perPage: 6);
    result.fold(
      (error) => null,
      (data) {
        page++;

        final users = (state as UserLoading).oldUsers;
        users.addAll(data);

        emit(UserSuccess(users));
      },
    );
  }
}