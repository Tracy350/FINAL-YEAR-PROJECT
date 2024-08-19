import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial2/providers/search_controller.dart';
import 'package:trial2/chatbot_stuff/chatbot.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/screens/homepage.dart';
import 'package:trial2/screens/official_booking.dart';
import 'package:trial2/screens/profile/profile.dart';
import 'package:trial2/screens/searchpage.dart';

class NavigationBody extends StatefulWidget {
  const NavigationBody({super.key});

  @override
  State<NavigationBody> createState() => _NavigationBodyState();
}

class _NavigationBodyState extends State<NavigationBody> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomePage(),
    const SearchPage(),
    const OfficialBooking(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    SearchFieldController searchFieldController =
        Provider.of<SearchFieldController>(context, listen: true);

    if (searchFieldController.isSearchClicked && _currentIndex != 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _currentIndex = 1;
        });
        searchFieldController.resetSearchPage();
      });
    }

    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIconTheme: const IconThemeData(color: AppColors.green1),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
      ),
    );
  }
}
