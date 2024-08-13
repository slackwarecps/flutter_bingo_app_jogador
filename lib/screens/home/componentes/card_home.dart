import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String tituloDoCard;

  const HomeCard({Key? key, required this.tituloDoCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            width: 150,
            height: 100,
            child: Text(tituloDoCard),
          ),
        ),
      ),
    );
  }
}