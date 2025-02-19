import 'package:InOut/core/widgets/button_full_width.dart';
import 'package:InOut/presentation/pages/login_screen/widgets/login_form.dart';
import 'package:InOut/presentation/pages/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  bool isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 200;

    setState(() {
      this.isKeyboardOpen = isKeyboardOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            SizedBox(
              height: isKeyboardOpen ? 50 : 140,
            ),
            Hero(
              tag: "icon-tag",
              child: Image.asset(
                "assets/images/icon-white.png",
                width: 150,
                height: 80,
              ),
            ),
            isKeyboardOpen
                ? const SizedBox()
                : const Text(
                    "Your in and out management",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
            SizedBox(
              height: isKeyboardOpen ? 10 : 80,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  40,
                  20,
                  30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: LoginForm(
                        isKeyboardOpen: isKeyboardOpen,
                      ),
                    ),
                    isKeyboardOpen
                        ? const SizedBox()
                        : ButtonFullWidth(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text("New to InOut? Sign up!"),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
