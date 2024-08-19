import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/auth/login.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Logout',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 20))),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Text('Are you sure you want to log out?',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18))),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LogIn(),
                      ));
                    },
                    child: const Text(
                      'Yes, Logout',
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Container(
                height: 50,
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: const Color(0xFFE8F8EF),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.green1),
                    ))),
          )
        ],
      ),
    );
  }
}
