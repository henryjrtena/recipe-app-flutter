import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/search_recipe_textfield.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';
import 'package:flutter/material.dart';

class AddRecipeModalForm extends StatefulWidget {
  const AddRecipeModalForm({super.key});

  @override
  State<AddRecipeModalForm> createState() => _AddRecipeModalFormState();
}

class _AddRecipeModalFormState extends State<AddRecipeModalForm> {
  late final TextEditingController addRecipeController;

  @override
  void initState() {
    super.initState();
    addRecipeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 30, 30, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: Button.circleAddButton(color: secondaryColor),
              onPressed: _dismissModelSheetForm,
              child: const Icon(
                Icons.close,
                color: white,
                size: 40.0,
              ),
            ),
          ),
          const VerticalSpacing(height: 30.0),
          Text(
            yourMealNameLabel,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
          ),
          const VerticalSpacing(height: 30.0),
          Text(
            mealLabel,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(height: 10.0),
          MealDBTextField(
            controller: addRecipeController,
            maxLines: 5,
          ),
          const VerticalSpacing(height: 50.0),
          ElevatedButton(
            style: Button.fluidButton(),
            onPressed: () {},
            child: Text(
              addMealLabel,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
            ),
          ),
          const VerticalSpacing(height: 30.0)
        ],
      ),
    );
  }

  void _dismissModelSheetForm() {
    Navigator.pop(context);
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
