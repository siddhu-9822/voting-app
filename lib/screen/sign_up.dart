import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/login_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Controllers to capture text
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03),

              Image.asset(
                'assets/images/vote_logo.png',
                height: size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.03),

              // Email
              _buildTextField(label: 'Email', controller: emailController),
              SizedBox(height: size.height * 0.03),

              // Password
              _buildTextField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
                isVisible: _isPasswordVisible,
                onVisibilityChanged: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
              ),
              SizedBox(height: size.height * 0.03),

              // Confirm Password
              _buildTextField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                isPassword: true,
                isVisible: _isConfirmPasswordVisible,
                onVisibilityChanged: () {
                  setState(
                    () =>
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),

              // Username
              _buildTextField(
                label: 'Username',
                controller: usernameController,
              ),

              SizedBox(height: size.height * 0.06),

              // Sign Up Button
              CustomButton(
                text: 'Sign Up',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  // Save email, password, and username
                  await prefs.setString('email', emailController.text.trim());
                  await prefs.setString(
                    'password',
                    passwordController.text.trim(),
                  );
                  await prefs.setString(
                    'username',
                    usernameController.text.trim(),
                  );

                  // Optional: also mark first login as incomplete
                  await prefs.setBool('isFirstLoginComplete', false);
                  await prefs.setBool('loggedIn', false);

                  // Navigate to Login Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleLoginScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: size.height * 0.02),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(fontSize: size.width * 0.035),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SimpleLoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Log In.",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibilityChanged,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isVisible,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color.fromARGB(30, 168, 167, 167),
        labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: onVisibilityChanged,
              )
            : null,
      ),
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }
}
