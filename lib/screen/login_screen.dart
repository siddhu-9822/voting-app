import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/sign_up.dart';
import 'package:flutter_vote/screen/welcome_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleLoginScreen extends StatefulWidget {
  final String? registeredEmail;
  final String? registeredPassword;

  const SimpleLoginScreen({
    super.key,
    this.registeredEmail,
    this.registeredPassword,
  });

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (email == savedEmail && password == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }

    if (email == savedEmail && password == savedPassword) {
      await prefs.setBool('loggedIn', true); // Save login status

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.10),

                // Logo
                SizedBox(
                  height: size.height * 0.20,
                  child: Image.asset('assets/images/vote_logo.png'),
                ),

                SizedBox(height: size.height * 0.10),

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hint: Text("Enter Email"),
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
                    hint: Text("Enter Password"),
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
                    // Navigate to Sign Up Screen or Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
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
