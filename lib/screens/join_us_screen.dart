import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinUsScreen extends ConsumerStatefulWidget {
  const JoinUsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends ConsumerState<JoinUsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignInPressed() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Us"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              TextField(controller: _emailController),
              TextField(
                controller: _passwordController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _onSignInPressed,
                child: const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
