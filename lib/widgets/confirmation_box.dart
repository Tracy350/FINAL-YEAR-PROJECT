import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/navidation_body.dart';

class ConfirmationBox extends StatelessWidget {
  const ConfirmationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/Group.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Congratulations!',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: AppColors.green1,
                      fontWeight: FontWeight.w700,
                      fontSize: 25)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Your account is ready to use',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 40,
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: const Color.fromARGB(255, 47, 183, 103),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationBody()));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
