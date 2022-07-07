import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/application/user_state.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/application/users_watcher.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/widgets/user_item.dart';

class ThirdScreen extends StatefulWidget {
  static const route = "/third";

  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    debugPrint("Init state!");
    context.read<UserWatcher>().getAllUsers();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        debugPrint("Mentok!");
        context.read<UserWatcher>().getAllUsers();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: const Text(
            "Third Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Builder(
          builder: (bodyCtx) => SizedBox(
            width: double.infinity,
            child: BlocBuilder<UserWatcher, UserState>(
              bloc: bodyCtx.read<UserWatcher>()..getAllUsers(),
              builder: (ctx, state) {
                if (state is UserLoading && state.isFirstFetch) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<User> users = [];
                bool isLoading = false;

                if (state is UserLoading) {
                  users = state.oldUsers;
                  isLoading = true;
                } else if (state is UserSuccess) {
                  users = state.users;
                }

                return RefreshIndicator(
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Colors.black12,
                  onRefresh: () async {
                    context.read<UserWatcher>().getAllUsers();
                  },
                  child: ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (ctx, index) => Divider(
                      color: Colors.grey[800],
                    ),
                    itemCount: users.length + (isLoading ? 1 : 0),
                    itemBuilder: (ctx, index) {
                      if (users.isEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/error.svg",
                              color: Colors.white54,
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Users not found",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      }
                      if (index < users.length) {
                        return UserItem(
                          user: users[index],
                          onPressed: (user) {
                            Navigator.pop(
                              context,
                              "${user.firstName} ${user.lastName}",
                            );
                          },
                        );
                      } else {
                        scrollController.jumpTo(
                          scrollController.position.maxScrollExtent,
                        );
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
