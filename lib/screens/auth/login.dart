// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:trial2/screens/auth/sign_up.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/widgets/square_tile.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signin(
      String emailAddress, String password, BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Logger().d(credential);

      if (credential.user != null) {
        setState(() {
          isLoading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavigationBody()));
      }
    } on FirebaseAuthException catch (e) {
      Logger().d(e.code);
      setState(() {
        isLoading = false;
      });
      if (e.code == 'invalid-credential') {
        Logger().d('Invalid credential');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid credential')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back, size: 20)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Login to your Account',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(vertical: 15.0),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: AppColors.hinttext),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.hinttext,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.inputinactive)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.green1)),
                        filled: true,
                        fillColor: AppColors.inputinactive,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsetsDirectional.symmetric(
                              vertical: 15.0),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: AppColors.hinttext),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: AppColors.hinttext,
                          ),
                          suffixIcon: IconButton(
                            icon: _isPasswordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.inputinactive)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.green1)),
                          filled: true,
                          fillColor: AppColors.inputinactive),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 8) {
                          return "Password must be atleast 8 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                            _isChecked
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Take User to Reset Password Page"),
                                    ),
                                  )
                                : "";
                          },
                          activeColor: AppColors.green1,
                        ),
                        Text(
                          'Remember me',
                          style: GoogleFonts.montserrat(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
                    child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: isLoading == true
                            ? const Center(child: CircularProgressIndicator())
                            : MaterialButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: AppColors.green1,
                                onPressed: () async {
                                  bool isValidated =
                                      _formKey.currentState!.validate();
                                  if (isValidated) {
                                    await signin(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        context);
                                  } else {}
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('or continue with'),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ))
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SquareTile(svgPath: 'assets/icons/apple.svg'),
              SquareTile(svgPath: 'assets/icons/google.svg'),
              SquareTile(svgPath: 'assets/icons/facebook.svg')
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.montserrat(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ));
                },
                child: Text(
                  'Sign up',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: AppColors.green1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
