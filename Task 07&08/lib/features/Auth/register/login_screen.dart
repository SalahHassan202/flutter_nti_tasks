import 'package:flutter/material.dart';
import 'package:splach_app/core/widgets/custom_text_form_feild_widget.dart';
import 'package:splach_app/features/home/view/widgets/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter Your Data"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 176, 211, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 149, 241),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: "Username",
                icon: Icons.person,
                controller: userController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Email",
                icon: Icons.email_outlined,
                controller: emailController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Phone Number",
                icon: Icons.phone,
                controller: phoneController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Password",
                icon: Icons.lock,
                isPassword: true,
                controller: passController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onLoginPressed,
                  child: const Text("Login", style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
