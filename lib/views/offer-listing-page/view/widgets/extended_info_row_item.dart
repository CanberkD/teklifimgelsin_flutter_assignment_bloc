import 'package:flutter/material.dart';

class ExtendedInfoRowItem extends StatelessWidget {
  const ExtendedInfoRowItem({
    super.key,
    required this.value, 
    required this.title,
  });

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center,),
          Text( title == 'Yıllık Ödeme' ? '₺$value' : '%$value', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15),)
        ],
      ),
    );
  }
}