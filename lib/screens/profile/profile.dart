import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/editprofile.dart';
import 'package:trial2/screens/profile/profile_notification.dart';
import 'package:trial2/screens/profile/profile_security.dart';
import 'package:trial2/widgets/bottom_modal.dart';
import 'package:trial2/widgets/profile_listtile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController fName = TextEditingController();

  final TextEditingController _email = TextEditingController();
  String userInitial = "";

  Future<void> getUser() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .get();
        Logger().d(userDoc);
        String u = userDoc["firstName"] as String;
        Logger().d(u);
        setState(() {
          userInitial = u.substring(0, 1);
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/homelogo.png',
            ),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.green1,
                        radius: 90,
                        child: Center(
                          child: Text(
                            userInitial.toUpperCase(),
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 50)),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: AppColors.green1,
                                shape: BoxShape.circle),
                            child: const Icon(Icons.edit,
                                color: Colors.white, size: 20),
                          ))
                    ],
                  ),
                  // Text(_email.toString())
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ProfileListTile(
                title: 'Edit Profile',
                icon: 'assets/icons/editporfile.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                }),
            ProfileListTile(
                title: 'Payment',
                icon: 'assets/icons/profilepayment.png',
                press: () {}),
            ProfileListTile(
                title: 'Notifications',
                icon: 'assets/icons/profilenotification.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileNotification()),
                  );
                }),
            ProfileListTile(
                title: 'Security',
                icon: 'assets/icons/profilesecurity.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileSecurity()),
                  );
                }),
            ProfileListTile(
                title: 'Help',
                icon: 'assets/icons/profilehelp.png',
                press: () {}),
            ProfileListTile(
                title: 'Logout',
                icon: 'assets/icons/profilelogout.png',
                press: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      builder: ((context) {
                        return const BottomModal();
                      }));
                }),
          ],
        ),
      ),
    );
  }
}
