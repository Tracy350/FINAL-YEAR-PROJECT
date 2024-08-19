import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trial2/chatbot_stuff/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trial2/providers/search_controller.dart';
import 'package:trial2/screens/searchpage.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/screens/booking/booking_list.dart';
import 'package:trial2/screens/bookmark.dart';
import 'package:trial2/screens/notification_list.dart';
import 'package:trial2/widgets/tourist_places.dart';
import 'package:trial2/widgets/booking_home.dart';
import 'package:trial2/widgets/top_rated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ratings = Rating.dataSample;
  dynamic userInfo = {};

  final FocusNode _focusNode = FocusNode();

  Future<void> getUser() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .get();
        setState(() {
          userInfo = userDoc;
        });
      }
    } catch (e) {
      Logger().d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchController =
        Provider.of<SearchFieldController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/homelogo.png'),
                    ),
                    Text('Helia',
                        style: GoogleFonts.montserrat(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationList()),
                        );
                      },
                      icon: Image.asset('assets/icons/Notification.png'),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bookmark()),
                        );
                      },
                      icon: Image.asset('assets/icons/Bookmark.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Hello, ${userInfo!["firstName"] ?? ""} 👋',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: AppColors.bordercolor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Handle the tap event to change navigation index or perform other actions
                      searchController.toggleSearchPage();
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TextFormField(
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(
                            Icons.filter_alt,
                            color: AppColors.green1,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.inputactive),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TouristPages(),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                    ratings.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TopRatedTile(
                        rating: ratings[index],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  children: [
                    Text(
                      'Recently Booked',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AllBooking()));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.montserrat(
                              color: AppColors.green1,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: ratings.length * 90,
                child: ListView.builder(
                  itemCount: ratings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeBooking(
                        rating: ratings[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chatbot()));
        },
        icon: Icon(Icons.chat),
        label: Text('Chat'),
      ),
    );
  }
}
