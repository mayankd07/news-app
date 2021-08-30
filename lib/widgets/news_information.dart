import 'package:flutter/material.dart';
import 'package:news_app/helper/constants.dart';

class NewsInforamation extends StatelessWidget {
  NewsInforamation({required this.infoData, required this.infoTitle});

  final String infoTitle;
  final String infoData;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            infoTitle,
            style: kNewsInfoTitleStyle,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            infoData == null || infoData==''? 'Unknown' : infoData,
            style: kNewsInfoDataStyle,
          ),
        ],
      ),
    );
  }
}
