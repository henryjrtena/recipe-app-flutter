import 'package:recipe_app_flutter/utilities/action_enum.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({
    required this.setIsReadyOnly,
    Key? key,
  }) : super(key: key);

  final ValueChanged<bool> setIsReadyOnly;

  @override
  Widget build(BuildContext context) {
    RecipeAction? actionMenu;

    return PopupMenuButton<RecipeAction>(
      color: primaryColor,
      offset: Offset.fromDirection(0, -50),
      initialValue: actionMenu,
      onSelected: (RecipeAction item) {
        if (item == RecipeAction.edit) setIsReadyOnly(false);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
        ),
        child: const Icon(
          Icons.more_vert,
          color: white,
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<RecipeAction>>[
        PopupMenuItem<RecipeAction>(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: white),
          value: RecipeAction.edit,
          child: const Text(editLabel),
        ),
        PopupMenuItem<RecipeAction>(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: white),
          value: RecipeAction.delete,
          child: const Text(deleteLabel),
        ),
      ],
    );
  }
}
