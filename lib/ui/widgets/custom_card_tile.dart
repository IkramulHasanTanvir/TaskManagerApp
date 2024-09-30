import 'package:flutter/material.dart';

class CustomCardTile extends StatelessWidget {
  const CustomCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      color: Colors.white,
      child: Text('data')
    );
  }
}
