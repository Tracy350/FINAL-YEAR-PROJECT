import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/auth/login.dart';
import 'package:trial2/screens/auth/sign_up.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Text("Let's you in",
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700))),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.bordercolor),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue with Facebook",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.bordercolor),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/google.svg',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.bordercolor),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/apple.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue with Apple",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('or'),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
              child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: AppColors.green1,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogIn()));
                    },
                    child: const Text(
                      'Log in with password',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.montserrat(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: AppColors.green1,
                              fontWeight: FontWeight.w600)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
