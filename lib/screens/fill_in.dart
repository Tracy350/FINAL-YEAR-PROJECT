import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trial2/providers/auth_provider.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/my_textfield.dart';
import 'package:trial2/services/constants.dart';

class FillIn extends StatefulWidget {
  const FillIn({super.key});

  @override
  State<FillIn> createState() => _FillInState();
}

class _FillInState extends State<FillIn> {
  String? _selectedValue;
  final TextEditingController fName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController gender = TextEditingController();
  void setUserInfo(
      {String? firstName,
      String? lastName,
      String? dateOfBirth,
      String? phoneNumber,
      String? email}) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "firstName": firstName,
        "lastName": lastName,
        "DOB": dateOfBirth,
        "phoneNumber": phoneNumber,
        "email": email,
        "role": "USER"
      });
    } catch (e) {
      Logger().d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    EmailProvider emailProvider =
        Provider.of<EmailProvider>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back, size: 20)),
          title: Text(
            'Fill Your Profile',
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.edit,
                              color: AppColors.green1, size: 20),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  height: 30,
                  hintText: 'Last Name',
                  controller: lastName,
                  obscureText: false),
              // TextField(
              //   decoration: const InputDecoration(
              //       border: InputBorder.none,
              //       contentPadding:
              //           EdgeInsetsDirectional.symmetric(vertical: 15.0),
              //       hintText: 'LastName',
              //       hintStyle: TextStyle(color: AppColors.hinttext),
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: AppColors.inputinactive)),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: AppColors.green1)),
              //       filled: true,
              //       fillColor: AppColors.inputinactive),
              //   controller: lastName,
              // ),
              const SizedBox(height: 15),
              MyTextField(
                  height: 30,
                  hintText: 'First Name',
                  controller: fName,
                  obscureText: false),
              // TextField(
              //     controller: fName,
              //     decoration: const InputDecoration(
              //         border: InputBorder.none,
              //         contentPadding:
              //             EdgeInsetsDirectional.symmetric(vertical: 15.0),
              //         hintText: 'First Name',
              //         hintStyle: TextStyle(color: AppColors.hinttext),
              //         enabledBorder: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: AppColors.inputinactive)),
              //         focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: AppColors.green1)),
              //         filled: true,
              //         fillColor: AppColors.inputinactive)),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: dob,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsetsDirectional.symmetric(vertical: 15.0),
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(color: AppColors.hinttext),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: AppColors.hinttext,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.inputinactive)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.green1)),
                      filled: true,
                      fillColor: AppColors.inputinactive)),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: phoneNumber,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsetsDirectional.symmetric(vertical: 15.0),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: AppColors.hinttext),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.inputinactive)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.green1)),
                      filled: true,
                      fillColor: AppColors.inputinactive)),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(vertical: 15.0),
                        hintText: 'Gender',
                        hintStyle: TextStyle(color: AppColors.hinttext),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.inputinactive)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.green1)),
                        filled: true,
                        fillColor: AppColors.inputinactive),
                    value: _selectedValue,
                    items: ['Male', 'Female']
                        .map((option) => DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 40,
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: AppColors.green1,
                    onPressed: () async {
                      setUserInfo(
                          dateOfBirth: dob.text.trim(),
                          firstName: fName.text.trim(),
                          lastName: lastName.text.trim(),
                          phoneNumber: phoneNumber.text.trim(),
                          email: emailProvider.getEmail);

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const NavigationBody()));

                      // showDialog(
                      //     context: context,
                      //     builder: (context) => const ConfirmationBox());
//
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ));
  }
}
