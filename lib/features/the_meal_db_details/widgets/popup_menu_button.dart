import 'package:recipe_app_flutter/utilities/action_enum.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class PopUpMenuButton extends StatefulWidget {
  const PopUpMenuButton({
    required this.setIsReadyOnly,
    required this.onDeleteRecipe,
    Key? key,
  }) : super(key: key);

  final ValueChanged<bool> setIsReadyOnly;
  final VoidCallback onDeleteRecipe;

  @override
  State<PopUpMenuButton> createState() => _PopUpMenuButtonState();
}

class _PopUpMenuButtonState extends State<PopUpMenuButton> {
  @override
  Widget build(BuildContext context) {
    RecipeAction? actionMenu;

    return PopupMenuButton<RecipeAction>(
      color: primaryColor,
      offset: Offset.fromDirection(0, -50),
      initialValue: actionMenu,
      onSelected: (RecipeAction item) {
        switch (item) {
          case RecipeAction.edit:
            widget.setIsReadyOnly(false);
            return;
          case RecipeAction.delete:
            _onDeleteRecipe();
            break;
          default:
        }
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

  void _onDeleteRecipe() {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Column(
        children: [
          const Text(deleteMessageConfirmation),
          TextButton(
            onPressed: _proceedDelete,
            child: const Text(deleteLabel),
          ),
          TextButton(
            onPressed: _cancelDelete,
            child: const Text(cancelLabel),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _proceedDelete() {
    widget.onDeleteRecipe();
    _navigateToOverviewPage();
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void _cancelDelete() {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void _navigateToOverviewPage() => Navigator.pop(context);
}
