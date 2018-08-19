import 'package:flutter/material.dart';
import 'package:meal_challenge/widgets/meal_description_card.dart';

typedef void MealCardTapCallback(int index);

class MealCard extends StatefulWidget {
  final int index;
  final MealCardTapCallback onTap;

  final double imageBottomMargin;
  final double mealCardDescriptionBottomOffset;

  final ShapeBorder imageCardShape;

  final bool showFav;

  final double imageCardElevation;

  MealCard({
    this.index,
    this.onTap,
    this.imageBottomMargin = 0.0,
    this.mealCardDescriptionBottomOffset = 18.0,
    this.imageCardShape = const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
      const Radius.circular(17.0),
    )),
    this.showFav = true,
    this.imageCardElevation = 1.0,
  });

  @override
  MealCardState createState() {
    return MealCardState();
  }

  Widget _gradient() {
    return const DecoratedBox(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: const Alignment(0.0, -1.0),
          end: const Alignment(0.0, -0.4),
          colors: const <Color>[
            const Color(0x60000000),
            const Color(0x00000000)
          ],
        ),
      ),
    );
  }

  String _getImageForIndex(int index) {
    int normalizeIndex = index % 7 + 1;
    return "assets/meals/meal_$normalizeIndex.png";
  }
}

class MealCardState extends State<MealCard> {
  bool _isFav = false;

  Color _getFavColor() {
    return _isFav ? Colors.red : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        radius: 6.0,
        onTap: () {
          widget.onTap(widget.index);
        },
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Card(
              shape: widget.imageCardShape,
              elevation: widget.imageCardElevation,
              margin: EdgeInsets.only(bottom: widget.imageBottomMargin),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    widget._getImageForIndex(widget.index),
                    fit: BoxFit.cover,
                  ),
                  widget._gradient(),
                ],
              ),
            ),
            widget.showFav
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              shape: CircleBorder(),
                              splashColor: Colors.grey,
                              child: Icon(
                                Icons.favorite,
                                color: _getFavColor(),
                              ),
                              highlightColor: Colors.black45,
                              onPressed: () {
                                setState(() {
                                  _isFav = !_isFav;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            PositionedDirectional(
              child: MealDescriptionCard(
                title: "title ${widget.index}",
                description: "description ${widget.index} ",
                rankDescription: "4.${widget.index}",
                votesCount: "(203)",
                openHoursDescription: "10-25m ${widget.index}",
                priceDescription: "Free",
              ),
              bottom: widget.mealCardDescriptionBottomOffset,
              start: 18.0,
              end: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
