import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/providers/search_controller.dart';
import 'package:trial2/screens/hotel/hotel_details.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/widgets/booking_home.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ratings = Rating.dataSample;
  List<Rating> filteredRatings = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchRatings);
    filteredRatings = ratings; // Initialize with all ratings
  }

  void _searchRatings() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredRatings = ratings.where((rating) {
        return rating.hotelname.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchFieldController searchFieldController =
        Provider.of<SearchFieldController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        searchFieldController.resetSearchPage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationBody(),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.bordercolor,
                        ),
                        child: TextFormField(
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: _searchController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.cancel_sharp),
                                    onPressed: () {
                                      _searchController.clear();
                                    },
                                  ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.inputactive,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Recent',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ))),
              ),
              // Previous searches
              Container(
                color: Colors.white,
                height: 100,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => previousSearchItem(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Search List
              Container(
                color: Colors.white,
                child: Column(
                  children: [searchItemList()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget previousSearchItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: InkWell(
        onTap: () {
          // Implement the action when a previous search item is tapped
        },
        child: Row(
          children: [
            const Icon(
              Icons.timer_outlined,
              color: AppColors.green1,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Movenpick Hotel',
              style: GoogleFonts.montserrat(),
            ),
            const Spacer(),
            const Icon(
              Icons.call_made_outlined,
              color: AppColors.green1,
            ),
          ],
        ),
      ),
    );
  }

  Widget searchItemList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Results',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ))),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: filteredRatings.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HotelDetail(
                                      rating: filteredRatings[index],
                                    )));
                      },
                      child: HomeBooking(
                        rating: filteredRatings[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
