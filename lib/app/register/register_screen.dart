import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apptours/app/auth/controllers/auth_store.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/core/controllers/mixins.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ReactionDisposerMixin {
  final _store = AuthStore();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  bool errorShowing = false;
  @override
  get reactions => [
        reaction((_) => _store.userId, (userId) {
          if (userId != null) {
            Navigator.of(context).pop(true);
          }
        }),
        reaction((_) => _store.error, (e) {
          errorShowing = true;
        }),
      ];

  void _onCreateAccountPressed() {
    setState(() {
      errorShowing = false;
    });

    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      _store.register(email, password, name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tashkent_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: Navigator.of(context).pop,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        iconSize: 24,
                        icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(color: HexColor("#BB000000"), borderRadius: BorderRadius.circular(17)),
                  child: Observer(builder: (context) {
                    if (_store.isLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: CircularProgressIndicator(
                            color: AppColors.accentGreen,
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 24.0),
                      child: Column(
                        children: [
                          Text(
                            '${s.text_welcome_to} Apptours.Travel',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.light,
                              fontWeight: FontWeight.w800,
                              fontSize: 34,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            s.text_create_account_to_proceed,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 32),
                          TextField(
                            controller: _nameController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: AppColors.light,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.white24,
                              hintText: s.label_fullname,
                              hintStyle: const TextStyle(
                                color: Colors.white38,
                                fontSize: 16,
                              ),
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 11,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _emailController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: AppColors.light,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              fillColor: Colors.white24,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 16,
                              ),
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 11,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            style: const TextStyle(
                              color: AppColors.light,
                              fontSize: 16,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Colors.white24,
                              filled: true,
                              hintText: s.label_password,
                              hintStyle: const TextStyle(
                                color: Colors.white38,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 11,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (_store.error != null)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _store.error.toString().substring(10),
                                textAlign: TextAlign.start,
                                style: const TextStyle(color: AppColors.red, fontSize: 14),
                              ),
                            ),
                          const SizedBox(height: 32),
                          GestureDetector(
                            onTap: _onCreateAccountPressed,
                            child: Container(
                              height: 48,
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: AppColors.accentGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    s.label_create_an_account,
                                    style: const TextStyle(
                                      color: AppColors.textGreen,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          InkWell(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              s.text_already_have_an_account,
                              style: const TextStyle(color: AppColors.accentGreen),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const Spacer(),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
