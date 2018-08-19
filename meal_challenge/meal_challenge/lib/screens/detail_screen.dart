import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_challenge/assets/app_colors.dart';
import 'package:meal_challenge/assets/app_text_styles.dart';
import 'package:meal_challenge/widgets/default_divider.dart';
import 'package:meal_challenge/widgets/meal_card.dart';

class DetailScreen extends StatefulWidget {
  static final defaultPadding = 12;
  final double viewportFraction;

  final int index;
  DetailScreen({this.index, @required this.viewportFraction});

  @override
  MealDetailScreenState createState() {
    return MealDetailScreenState();
  }

  void goBack(BuildContext context, int index) {
    Navigator.of(context).pop();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  // final int index;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
      margin: const EdgeInsets.only(right: 10.0),
      child: RaisedButton(
        elevation: 2.0,
        shape: CircleBorder(),
        splashColor: Colors.transparent,
        onPressed: onPressed,
        color: AppColor.white,
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 19.0,
        ),
      ),
    );
  }
}

class MealDetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 23,
                child: Container(
                  color: AppColor.white,
                  child: Hero(
                    tag: widget.index,
                    child: MealCard(
                        onTap: (index) =>
                            print("OntapPressed MealCard index $index"),
                        imageBottomMargin: 30.0,
                        showFav: false,
                        mealCardDescriptionBottomOffset: 0.0,
                        imageCardShape: const RoundedRectangleBorder(
                            borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(0.0),
                          topRight: const Radius.circular(0.0),
                          bottomLeft: const Radius.elliptical(500.0, 75.0),
                          bottomRight: const Radius.elliptical(500.0, 75.0),
                        )),
                        index: widget.index,
                        imageCardElevation: 0.0),
                  ),
                ),
              ),
              Expanded(
                flex: 27,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Featured Items",
                                  style: AppTextStyle.title18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black26),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                pageSnapping: true,
                                controller: PageController(
                                    viewportFraction: widget.viewportFraction),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.0, right: 4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 5,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              const Radius.circular(17.0),
                                            ),
                                            child: Image.asset(
                                              "assets/meals/meal_${7 - index}.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                Text(
                                                  "Basil lemon Spaghetti",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: -0.5,
                                                    wordSpacing: -0.5,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2.0,
                                                          bottom: 14.0),
                                                  child: Text(
                                                    "\$13.50",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.0,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // DefaultDivider(),
                    Expanded(
                      flex: 4,
                      child: Container(),
                    )
                  ],
                ),
              )
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: _topBar(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RoundButton(
          onPressed: () => widget.goBack(context, widget.index),
          icon: Icons.arrow_back_ios,
        ),
        Spacer(),
        RoundButton(
          onPressed: () {},
          icon: Icons.share,
        ),
        RoundButton(
          onPressed: () {},
          icon: Icons.favorite,
        ),
      ],
    );
  }
}
