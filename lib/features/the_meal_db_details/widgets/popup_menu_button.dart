import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';

enum Action { edit, delete }

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({Key? key, required this.setIsReadyOnly,}) : super(key: key);

  final ValueChanged<bool> setIsReadyOnly;

  @override
  Widget build(BuildContext context) {
    Action? actionMenu;

    return PopupMenuButton<Action>(
      color: primaryColor,
      offset: Offset.fromDirection(0, -50),
      initialValue: actionMenu,
      onSelected: (Action item) {
        if (item == Action.edit) setIsReadyOnly(false);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: const Icon(
          Icons.more_vert,
          color: white,
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Action>>[
        PopupMenuItem<Action>(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: white),
          value: Action.edit,
          child: const Text('Edit'),
        ),
        PopupMenuItem<Action>(
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: white),
          value: Action.delete,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
