import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class EmptyRecipesView extends StatelessWidget {
  const EmptyRecipesView({
    required this.onAddRecipe,
    super.key,
  });

  final VoidCallback onAddRecipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(noRecipesSVGSource),
          Text(
            makeItYourOwnWayLabel,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            addRecipeLabel,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const VerticalSpacing(height: 10.0),
          ElevatedButton(
            onPressed: onAddRecipe,
            style: Button.circleAddButton(),
            child: const Icon(
              Icons.add,
              color: white,
              size: 40.0,
            ),
          )
        ],
      ),
    );
  }
}
