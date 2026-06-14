import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';

class SuraListWidget extends StatelessWidget {
  int index;
  String suraEnName;
  String suraArName;
  String ayaNumber;
  SuraListWidget({
    super.key,
    required this.index,
    required this.suraEnName,
    required this.suraArName,
    required this.ayaNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.suraVector),
            Text(
              "$index",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraEnName,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "$ayaNumber Verses",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          suraArName,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
