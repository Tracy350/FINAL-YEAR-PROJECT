// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trial2/providers/auth_provider.dart';
import 'package:trial2/screens/auth/login.dart';
import 'package:trial2/screens/fill_in.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/widgets/square_tile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  bool isLoading = false;

  bool weakPassword = false;
  String? _emailError;
  String? _passwordError;

  Future<bool> signup(
      String emailAddress, String password, BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // Check if sign up is successful
      if (credential.user != null) {
        EmailProvider emailProvider =
            Provider.of<EmailProvider>(context, listen: false);
        emailProvider.setEmail = emailAddress;
        setState(() {
          isLoading = false;
        });
        // Now you should be able to see the new user in Firebase console
        return Future.value(true);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'Weak-Password') {
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      Logger().d(e);
    }

    return Future.value(false);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Create your Account',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsetsDirectional.symmetric(vertical: 15.0),
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.inputinactive),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.green1),
                ),
                filled: true,
                fillColor: AppColors.inputinactive,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsetsDirectional.symmetric(vertical: 15.0),
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.password),
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
                    borderSide: BorderSide(color: AppColors.inputinactive),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green1),
                  ),
                  filled: true,
                  fillColor: AppColors.inputinactive,
                ),
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
                    },
                    activeColor: AppColors.green1,
                  ),
                  const Text(
                    'Remember me',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
              child: Container(
                height: 40,
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : MaterialButton(
                        elevation: 0,
                        onPressed: () async {
                          bool userCreated = await signup(emailController.text,
                              passwordController.text, context);
                          if (userCreated) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FillIn()));
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: AppColors.green1,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('or continue with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SquareTile(svgPath: 'assets/icons/apple.svg'),
                SquareTile(svgPath: 'assets/icons/google.svg'),
                SquareTile(svgPath: 'assets/icons/facebook.svg'),
              ],
            ),
            const SizedBox(height: 20), // Replace Spacer with SizedBox
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                ),
                Text(
                  'Sign in',
                  style: TextStyle(
                    color: AppColors.green1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
