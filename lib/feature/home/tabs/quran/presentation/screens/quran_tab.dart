import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:islami_app/feature/home/tabs/quran/data/model/sura_model.dart';
import 'package:islami_app/feature/home/tabs/quran/presentation/screens/sura_details_screen.dart';
import 'package:islami_app/feature/home/tabs/quran/presentation/widgets/sura_list_widget.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(AppImages.islamiLogo)),
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryGold, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryGold, width: 2),
              ),
              prefixIcon: ImageIcon(
                color: AppColors.primaryGold,
                AssetImage(AppImages.quranIcon),
              ),
              hintText: 'Sura Name',
              hintStyle: TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Most Recently",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SuraEn'),
                    Text('SuraAr'),
                    Text('Aya Number'),
                  ],
                ),
                Image.asset(AppImages.mostRecently),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Sura List",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: 30.5,
                  endIndent: 30,
                );
              },
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: SuraModel.getSuraModel(index),
                    );
                  },
                  child: SuraListWidget(
                    suraModel: SuraModel.getSuraModel(index),
                  ),
                );
              },
              itemCount: SuraModel.getItemCount(),
            ),
          ),
        ],
      ),
    );
  }
}
