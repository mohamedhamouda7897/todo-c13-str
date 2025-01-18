import 'package:flutter/material.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/screens/home/home_screen.dart';
import 'package:todo_c13_str/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
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
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username Is Required";
                    }

                    return null;
                  },
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
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Is Required";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Email Not valid";
                    }
                    return null;
                  },
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
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char";
                    }

                    return null;
                  },
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
                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char";
                    }

                    if (value != passwordController.text) {
                      return "password doesn't match";
                    }
                    return null;
                  },
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseManager.createAccount(nameController.text,
                          emailController.text, passwordController.text, () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                              title: Center(child: CircularProgressIndicator()),
                              backgroundColor: Colors.transparent),
                        );
                      }, () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) => false,
                        );
                      }, (message) {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("Something went wrong"),
                                  content: Text(message),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                ));
                      });
                    }
                  },
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
      ),
    );
  }
}
