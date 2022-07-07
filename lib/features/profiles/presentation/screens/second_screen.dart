import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_suitmedia_test/di/app_module.dart';
import 'package:user_suitmedia_test/features/profiles/domain/repository/i_user_repository.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/application/users_watcher.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const route = "/second";

  final String name;

  const SecondScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _text = "Choose a User";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: const Text(
            "Second Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        bottomNavigationBar: MaterialButton(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(32),
          elevation: 0,
          highlightElevation: 0,
          child: const Text(
            "Choose a User",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: UserWatcher(injector.get<IUserRepository>()),
                  child: const ThirdScreen(),
                ),
              ),
            );

            if (!mounted) {
              return;
            }

            setState(() {
              if (result != null) {
                _text = result.toString();
              } else {
                _text = "Choose a User";
              }
            });
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Text(
                    _text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
