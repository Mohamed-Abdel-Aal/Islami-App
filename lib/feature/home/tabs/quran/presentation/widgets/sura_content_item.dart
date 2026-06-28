import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;
  SuraContentItem({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryGold, width: 2),
      ),
      child: Text(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        "$content [${index + 1}]",
        style: TextStyle(fontSize: 18, color: AppColors.primaryGold),
      ),
    );
  }
}
