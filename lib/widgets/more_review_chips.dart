import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:trial2/utils/colors.dart';

class MoreReviewsChips extends StatefulWidget {
  const MoreReviewsChips({super.key});

  @override
  State<MoreReviewsChips> createState() => _MoreReviewsChips();
}

class _MoreReviewsChips extends State<MoreReviewsChips> {
  final List<String> _choice = ['5.0', '4.0', '3.0', '2.0', '1.0'];

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
      runSpacing: 100,
    );
  }
}
