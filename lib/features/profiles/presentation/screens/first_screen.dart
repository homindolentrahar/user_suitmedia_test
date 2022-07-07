import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_suitmedia_test/features/profiles/presentation/screens/second_screen.dart';
import 'package:user_suitmedia_test/features/profiles/utils/palindrome.dart';

class FirstScreen extends StatefulWidget {
  static const route = "/first";

  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(360),
                ),
                child: SvgPicture.asset(
                  "assets/icons/user_add.svg",
                  color: Colors.white,
                  width: 32,
                  height: 32,
                ),
              ),
              const SizedBox(height: 56),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name cannot be empty!";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.3,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 0.5,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 1.3,
                          ),
                        ),
                        hintText: "Name",
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _palindromeController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Palindrome cannot be empty!";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.3,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 0.5,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 1.3,
                          ),
                        ),
                        hintText: "Palindrome",
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    const SizedBox(height: 64),
                    MaterialButton(
                      minWidth: double.infinity,
                      elevation: 0,
                      highlightElevation: 0,
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Check",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final text =
                              _palindromeController.text.trim().toString();
                          final palindrome = Palindrome.isPalindrome(text);

                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    palindrome
                                        ? "Palindrome!"
                                        : "Not Palindrome!",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    text,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(32),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    MaterialButton(
                      minWidth: double.infinity,
                      elevation: 0,
                      highlightElevation: 0,
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final name = _nameController.text.trim().toString();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SecondScreen(name: name),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
