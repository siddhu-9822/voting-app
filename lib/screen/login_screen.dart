import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/sign_up.dart';
import 'package:flutter_vote/screen/welcome_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({super.key});

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    // Fixed email & password check
    if (email == "skkaa971@gmail.com" && password == "Siddhu@98") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Device size

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06, // 6% of screen width
              vertical: size.height * 0.02, // 2% of screen height
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.10),

                // Logo
                SizedBox(
                  height: size.height * 0.20,
                  child: Image.asset('asset/images/vote_logo.png'),
                ),

                SizedBox(height: size.height * 0.10),

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: const Color.fromARGB(46, 116, 116, 116),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),

                SizedBox(height: size.height * 0.05),

                // Password Field
                TextField(
                  obscureText: !_isPasswordVisible,
                  controller: _passwordController,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(46, 116, 116, 116),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),

                SizedBox(height: size.height * 0.02),

                // Forgot Password
                GestureDetector(
                  onTap: () {
                    // Forgot password logic
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.1),

                // Login Button
                CustomButton(text: "Log In", onPressed: _handleLogin),

                SizedBox(height: size.height * 0.02),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                        // Navigate to Sign Up Screen
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
