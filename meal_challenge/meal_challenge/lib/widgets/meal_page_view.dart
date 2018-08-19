import 'package:flutter/material.dart';
import 'package:meal_challenge/widgets/meal_card.dart';

class MealPageView extends StatefulWidget {
  final PageController _controller;

  final MealCardTapCallback onCardTaped;

  MealPageView(this._controller, {@required this.onCardTaped});

  @override
  _MealPageViewState createState() => _MealPageViewState(
        _controller,
        onCardTaped: onCardTaped,
      );
}

class _MealPageViewState extends State<MealPageView> {
  final PageController _controller;

  final MealCardTapCallback onCardTaped;

  _MealPageViewState(this._controller, {this.onCardTaped});

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  var _list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Used to build list items that haven't been removed.
  Widget _buildItem(BuildContext context, int index) {
    return Padding(
      padding: _getPadding(index),
      child: Hero(
        tag: index,
        child: MealCard(
          index: index,
          onTap: onCardTaped,
        ),
      ),
    );
  }

  EdgeInsets _getPadding(int index) {
    return const EdgeInsets.only(left: 6.0, right: 6.0);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      key: _listKey,
      itemCount: _list.length,
      pageSnapping: true,
      itemBuilder: _buildItem,
      controller: _controller,
    );
  }
}
