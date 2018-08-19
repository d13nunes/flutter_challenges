import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_challenge/assets/app_colors.dart';
import 'package:meal_challenge/assets/app_text_styles.dart';
import 'package:meal_challenge/screens/detail_screen.dart';
import 'package:meal_challenge/widgets/cousine_type.dart';
import 'package:meal_challenge/widgets/default_divider.dart';
import 'package:meal_challenge/widgets/dot_indicator.dart';
import 'package:meal_challenge/widgets/meal_page_view.dart';
import 'package:meal_challenge/widgets/meal_card.dart';
import 'package:meal_challenge/widgets/meal_description_card.dart';

class MainScreen extends StatefulWidget {
  static final defaultPadding = 12;
  final double _viewportFraction;
  MainScreen(double screenWidth)
      : _viewportFraction = (screenWidth - (defaultPadding * 2)) / screenWidth;

  @override
  MainScreenState createState() {
    return MainScreenState(_viewportFraction);
  }
}

class MainScreenState extends State<MainScreen> {
  PageController _pageController;
  MainScreenState(double viewportFraction) {
    _pageController = PageController(viewportFraction: viewportFraction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: TopScreen(
                pageController: _pageController, onCardTaped: _onCardTaped),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColor.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: CousineTypesList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: DefaultDivider(),
                  ),
                  Expanded(
                    flex: 13,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            buildFilterHeader(),
                            MealDescriptionCard(
                              title: "The Tang NYC",
                              description: "Asian, Noodles",
                              openHoursDescription: "15-25",
                              priceDescription: "Free over \$20",
                              rankDescription: "4.9",
                              votesCount: "(54)",
                              elevation: 8.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFilterHeader() {
    var title = "All restaurants";
    var subtitle = "Sorted By Fastes Delivery";
    var right = FilterIcon();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyle.title18,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black26,
              ),
            ),
          ],
        ),
        right,
      ],
    );
  }

  void _onCardTaped(int index) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, _, __) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          return DetailScreen(
            index: index,
            viewportFraction: widget._viewportFraction,
          );
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.filter_list,
          color: Colors.black,
          size: 18.0,
        ),
      ),
    );
  }
}

class CousineTypesList extends StatelessWidget {
  const CousineTypesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return CousineType("name $i");
        },
        itemCount: 10,
      ),
    );
  }
}

class TopScreen extends StatelessWidget {
  final MealCardTapCallback onCardTaped;
  const TopScreen({
    Key key,
    @required this.pageController,
    @required this.onCardTaped,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: AppColor.yellow,
        child: Container(
          color: AppColor.white,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(500.0, 100.0),
                          bottomRight: Radius.elliptical(500.0, 100.0),
                        ),
                        color: AppColor.yellow,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _topBar(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 35.0),
                      child: _cardList(pageController),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0, top: 12.0),
                    child: Center(
                      child: DotsIndicator(
                        controller: pageController,
                        itemCount: 10,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardList(PageController controller) =>
      MealPageView(controller, onCardTaped: onCardTaped);
}

Widget _topBar() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Delivery address",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.0,
                  wordSpacing: 0.0,
                  color: Colors.black38,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Bielawska 12",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      size: 15.0,
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 45.0,
          height: 45.0,
          margin: const EdgeInsets.only(right: 10.0),
          child: RaisedButton(
            elevation: 2.0,
            shape: CircleBorder(),
            splashColor: Colors.transparent,
            onPressed: () => print("pressed"),
            color: AppColor.white,
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 19.0,
            ),
          ),
        ),
        Container(
          width: 45.0,
          height: 45.0,
          child: RaisedButton(
            elevation: 2.0,
            splashColor: Colors.transparent,
            shape: CircleBorder(),
            onPressed: () => print("pressed"),
            color: AppColor.white,
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 19.0,
            ),
          ),
        ),
      ],
    ),
  );
}
