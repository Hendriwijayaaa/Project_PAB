import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wisata_candi/screens/signup_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';

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
        backgroundColor: Color.fromARGB(255, 54, 165, 6), // Kelly Green
        leading: Icon(Icons.login, color: Colors.black), // Black logo
      ),
      body: Container(
        color: Colors.white, // White background
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Centered Image (replace with your image)
                    Image.asset(
                      'images/logo1.png', // Replace with your image asset path
                      height: 120, // Adjust the height as needed
                    ),
                    const SizedBox(height: 20),

                    // Username field with white background
                    TextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      cursorColor: Colors.black, // Black cursor
                      decoration: InputDecoration(
                        labelText: 'Nama Pengguna',
                        hintText: 'Masukkan nama pengguna',
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                            color: Color.fromARGB(
                                255, 0, 0, 0)), // Kelly Green text
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black), // Black border when focused
                        ),
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
                      cursorColor: Colors.black, // Black cursor
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
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                            color: Color.fromARGB(
                                255, 0, 0, 0)), // Kelly Green text
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black), // Black border when focused
                        ),
                      ),
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: _signIn,
                    ),
                    const SizedBox(height: 20),

                    // Sign In Button with Kelly Green background and White Text
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 70),
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
                          backgroundColor: Color.fromARGB(
                              255, 54, 165, 6), // Kelly Green background
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
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87, // Dark text for contrast
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(
                                  255, 54, 165, 6), // Kelly Green color
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
