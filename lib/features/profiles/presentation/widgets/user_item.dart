import 'package:flutter/material.dart';
import 'package:user_suitmedia_test/features/profiles/domain/model/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  final ValueChanged<User> onPressed;

  const UserItem({Key? key, required this.user, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withOpacity(0.15),
        highlightColor: Colors.white.withOpacity(0.25),
        onTap: () => onPressed(user),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48,horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.network(
                  user.avatar,
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
