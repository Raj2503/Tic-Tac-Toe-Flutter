import 'package:flutter/material.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class O extends StatelessWidget {
  double size;
  Color color;

  O(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: MyTheme.blue,
        gradient: RadialGradient(
          radius: 0.18,
          colors: [Colors.transparent, color],
          stops: [1, 1],
        ),
      ),
    );
  }
}
