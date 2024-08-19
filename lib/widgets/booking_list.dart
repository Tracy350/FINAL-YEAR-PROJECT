import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:trial2/utils/colors.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  List<String> _choice = [
    'Ongoing',
    'Completed',
    'Cancelled',
    
  ];

  @override
  Widget build(BuildContext context) {
    return ChipList(
      listOfChipNames: _choice,
      activeBgColorList: [AppColors.green1],
      inactiveBgColorList: [Colors.white],
      activeTextColorList: [Colors.white],
      inactiveTextColorList: [AppColors.green1],
      activeBorderColorList: [AppColors.green1],
      inactiveBorderColorList: [AppColors.green1],
      listOfChipIndicesCurrentlySeclected: [0],
      showCheckmark: false,
    );
  }
}
