import 'package:flutter/material.dart';
import 'package:meal_challenge/assets/app_colors.dart';

class CousineType extends StatelessWidget {
  final String name;

  const CousineType(this.name, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Material(
              type: MaterialType.circle,
              elevation: 2.0,
              shadowColor: Colors.black12,
              color: Colors.white,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Icon(
                  Icons.fastfood,
                  size: 35.0,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
