import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  labelText: "Name",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color(0xFF7B7B7B),
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  labelText: "Email",
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xFF7B7B7B),
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  labelText: "Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF7B7B7B),
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFF7B7B7B),
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  labelText: "Re Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF7B7B7B),
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFF7B7B7B),
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF7B7B7B)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Register",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "I Have an Account? ",
                          style: Theme.of(context).textTheme.titleSmall),
                      TextSpan(
                          text: "Login",
                          style: Theme.of(context).textTheme.bodySmall!),
                    ],
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
