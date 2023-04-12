import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      padding: const EdgeInsets.all(20.0),
      child: child,
    );
  }
}
