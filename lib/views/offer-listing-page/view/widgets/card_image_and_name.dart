import 'package:flutter/material.dart';

class CardImageAndName extends StatelessWidget {
  const CardImageAndName({
    super.key,
    required this.imageUrl,
    required this.cardName
  });

  final String imageUrl;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardName, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,)
            ],
          ),
        )
      ],
    );
  }
}