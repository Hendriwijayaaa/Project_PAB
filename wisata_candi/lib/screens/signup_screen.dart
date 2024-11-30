import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wisata_candi/screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignUp = false;

  bool _obscurePassword = true;
  // // Fungsi untuk validasi password
  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   }
  //   if (value.length < 6) {
  //     return 'Password should be at least 6 characters';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Pasang AppBar
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Color.fromARGB(255, 223, 214, 240),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Fungsi untuk kembali ke layar sebelumnya
            //Navigator.pop(context);
          },
        ),
      ),
      //TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                //TODO: 4. Atur mainAxisAlignment dan CrossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO: 5. Buat TextFromField untuk nama lengkap
                  TextFormField(
                    controller: _fullnameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //TODO: 6. Buat TextFromField untuk nama pengguna
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan nama pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //TODO: 7. Buat TextFromField untuk kata sandi
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
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
                    ),
                    //validator: _validatePassword,
                    obscureText: _obscurePassword,
                  ),
                  //TODO: 8. Buat TextFromField untuk Sign In
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text('Sign Up'),
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
