import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignIn = false;
  bool _obscurePassword = true;

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorText = "Username and password cannot be empty";
      });
      return;
    }

    setState(() {
      _isSignIn = true;
    });

    // Simulate network request
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSignIn = false;
      });

      // Simulate successful login
      if (_usernameController.text == "admin" &&
          _passwordController.text == "password") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect username or password')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.green[700], // Dark green for app bar
        leading: Icon(Icons.login),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade300,
              Colors.white
            ], // Green to white gradient
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Username field with white background
                    TextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Nama Pengguna',
                        hintText: 'Masukkan nama pengguna',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor:
                            Colors.white, // White background for input fields
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password field with white background and visibility toggle
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        hintText: 'Masukkan kata sandi',
                        border: const OutlineInputBorder(),
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        filled: true,
                        fillColor:
                            Colors.white, // White background for input fields
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: _signIn,
                    ),
                    const SizedBox(height: 20),

                    // Sign In Button with Green background and White Text
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: _isSignIn
                          ? (Matrix4.identity()..scale(1.1))
                          : Matrix4.identity(),
                      child: ElevatedButton(
                        onPressed: _signIn,
                        child: _isSignIn
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700], // Green color for the button
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.black.withOpacity(0.4),
                          elevation: 10,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Sign-up navigation with clickable text
                    RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Daftar di sini.',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
