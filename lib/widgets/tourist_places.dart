import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:trial2/utils/colors.dart';

class TouristPages extends StatefulWidget {
  const TouristPages({super.key});

  @override
  State<TouristPages> createState() => _TouristPagesState();
}

class _TouristPagesState extends State<TouristPages> {
  final List<String> _choice = [
    'Recommended',
    'Popular',
    'Trending',
    'For you',
    'sime'
  ];

  @override
  Widget build(BuildContext context) {
    return ChipList(
      listOfChipNames: _choice,
      activeBgColorList: const [AppColors.green1],
      inactiveBgColorList: const [Colors.white],
      activeTextColorList: const [Colors.white],
      inactiveTextColorList: const [AppColors.green1],
      activeBorderColorList: const [AppColors.green1],
      inactiveBorderColorList: const [AppColors.green1],
      listOfChipIndicesCurrentlySeclected: const [0],
      showCheckmark: false,
    );
  }
}
