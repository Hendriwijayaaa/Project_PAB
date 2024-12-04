import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wisata_candi/screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Deklarasikan variabel yang dibutuhkan
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignUp = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Color.fromARGB(255, 54, 165, 6), // Kelly Green
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Black arrow
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TextFormField untuk nama lengkap
                  TextFormField(
                    controller: _fullnameController,
                    cursorColor: Colors.black, // Kursor hitam
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan nama',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 54, 165, 6)), // Kelly Green text
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border hitam saat fokus
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TextFormField untuk nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    cursorColor: Colors.black, // Kursor hitam
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan nama pengguna',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 54, 165, 6)), // Kelly Green text
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border hitam saat fokus
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TextFormField untuk kata sandi
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.black, // Kursor hitam
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
                      labelStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 54, 165, 6)), // Kelly Green text
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border hitam saat fokus
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  const SizedBox(height: 20),

                  // ElevatedButton untuk Sign Up
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
