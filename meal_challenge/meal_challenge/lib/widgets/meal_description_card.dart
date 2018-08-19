import 'package:flutter/material.dart';
import 'package:meal_challenge/assets/app_colors.dart';
import 'package:meta/meta.dart';

class MealDescriptionCard extends StatelessWidget {
  final String description;
  final String title;
  final String rankDescription;
  final String votesCount;
  final String openHoursDescription;
  final String priceDescription;
  final double elevation;
  const MealDescriptionCard({
    @required this.description,
    @required this.title,
    @required this.rankDescription,
    @required this.openHoursDescription,
    @required this.priceDescription,
    this.elevation: 0.0,
    @required this.votesCount,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: elevation,
      shadowColor: Colors.black12,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: _blackStyle(19.0),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    description,
                    style: _grayStyle(11.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 8.0),
              child: Divider(
                color: Colors.grey,
                height: 1.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 209, 0),
                      size: 20.0,
                    ),
                    Container(width: 2.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(rankDescription, style: _blackStyle(12.0)),
                        Container(width: 2.0),
                        Text(votesCount, style: _grayStyle(12.0)),
                      ],
                    )
                  ],
                ),
                Container(width: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.black26,
                      size: 20.0,
                    ),
                    Container(width: 2.0),
                    Text(
                      openHoursDescription,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    )
                  ],
                ),
                Container(width: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                          size: 10.0,
                        ),
                      ),
                    ),
                    Container(width: 4.0),
                    Text(
                      priceDescription,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _grayStyle(double fontSize) {
    return TextStyle(
      color: Colors.grey,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
      wordSpacing: -0.5,
    );
  }

  TextStyle _blackStyle(double fontSize) {
    return TextStyle(
        color: AppColor.black, fontSize: fontSize, fontWeight: FontWeight.w800);
  }
}
