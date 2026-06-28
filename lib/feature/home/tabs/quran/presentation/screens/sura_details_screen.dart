import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:islami_app/feature/home/tabs/quran/data/model/sura_model.dart';
import 'package:islami_app/feature/home/tabs/quran/presentation/widgets/sura_content_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFiles(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryGold,
          ),
        ),
      ),
      body: Stack(
        alignment: AlignmentGeometry.topCenter,
        children: [
          Container(
            color: AppColors.primaryDark,
            child: Image.asset(
              AppImages.suraDetailsBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 17),
              Text(
                args.suraArabicName,
                style: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryGold,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            content: verses[index],
                            index: index,
                          );
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {});
  }
}
