import 'package:flutter/material.dart';
import 'package:apptours/app/auth/controllers/auth_store.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/controllers/mixins.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with ReactionDisposerMixin {
  final _store = AuthStore();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _store.checkIfLoggedIn();
  }

  @override
  get reactions => [
        reaction((_) => _store.userId, (userId) {
          if (userId != null) {
            _navigateToMain();
          }
        }),
      ];

  void _onSignInPressed() {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      _store.login(email, password);
    }
  }

  void _navigateToRegistration() {
    Navigator.of(context).pushNamed(AppRoute.register).then((result) {
      if (result == true) {
        _navigateToMain();
      }
    });
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacementNamed(AppRoute.main);
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
                            s.text_sign_in_to_proceed,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 32),
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
                            onTap: _onSignInPressed,
                            child: Container(
                              height: 48,
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: AppColors.accentGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  s.label_sign_in,
                                  style: const TextStyle(
                                    color: AppColors.textGreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          InkWell(
                            onTap: _navigateToRegistration,
                            child: Text(
                              s.text_dont_have_an_account_yet,
                              style: const TextStyle(color: AppColors.accentGreen),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
