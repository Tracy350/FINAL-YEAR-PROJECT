import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/my_textfield.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/screens/profile/profile.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController fName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBody()),
            );
          },
          iconSize: 20,
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: Column(
          children: [
            MyTextField(
                height: 30,
                hintText: 'First Name',
                controller: fName,
                obscureText: false),
            MyTextField(
                height: 30,
                hintText: 'Last Name',
                controller: fName,
                obscureText: false),
            MyTextField(
                height: 30,
                hintText: 'Date of Birth',
                controller: fName,
                obscureText: false),
            MyTextField(
                height: 30,
                hintText: 'E-mail',
                controller: fName,
                obscureText: false),
            MyTextField(
                height: 30,
                hintText: 'Phone Number',
                controller: fName,
                obscureText: false),
            MyTextField(
                height: 30,
                hintText: 'Gender',
                controller: fName,
                obscureText: false),
            Container(
                height: 50,
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: AppColors.green1,
                  onPressed: () {},
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
