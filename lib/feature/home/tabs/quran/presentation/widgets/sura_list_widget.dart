import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:islami_app/feature/home/tabs/quran/data/model/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  SuraListWidget({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.suraVector),
            Text(
              "${suraModel.index + 1}",
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
                    suraModel.suraEnglishName,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "${suraModel.numOfVerses} Verses",
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
          suraModel.suraArabicName,
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
