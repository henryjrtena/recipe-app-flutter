import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/note_text_field.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/popup_menu_button.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';
import 'package:flutter/material.dart';

class TheMealDBApiDetailsPage extends StatefulWidget {
  const TheMealDBApiDetailsPage({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  final Recipe recipe;

  @override
  State<TheMealDBApiDetailsPage> createState() => _TheMealDBApiDetailsPageState();
}

class _TheMealDBApiDetailsPageState extends State<TheMealDBApiDetailsPage> {
  late final TextEditingController noteController;

  late bool isReadOnly;
  late bool isIngredientActive;
  late bool isRecipeActive;

  @override
  void initState() {
    super.initState();
    noteController = TextEditingController(text: dummyText);
    isReadOnly = true;
    isIngredientActive = true;
    isRecipeActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.recipe.strMealThumb),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: recipeCardBlackGradient,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: PopUpMenuButton(setIsReadyOnly: _setIsReadyOnly),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _gotoOverviewPage,
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: white,
                          ),
                        ),
                        const VerticalSpacing(height: 10.0),
                        Text(
                          widget.recipe.strCategory,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          widget.recipe.strMeal,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const VerticalSpacing(height: 10.0),
                  isReadOnly
                      ? const Text(dummyText)
                      : Column(
                          children: [
                            NoteTextField(
                              controller: noteController,
                              isReadOnly: isReadOnly,
                            ),
                            const VerticalSpacing(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                _setIsReadyOnly(true);
                              },
                              style: Button.fluidButton(),
                              child: Text(
                                'Update Notes',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: white),
                              ),
                            )
                          ],
                        ),
                  const VerticalSpacing(height: 20.0),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectTab(TabEnum.ingredient),
                        style: Button.leftBorderedRadius(isIngredientActive),
                        child: Text(
                          'Ingredients',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: isIngredientActive ? white : black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectTab(TabEnum.recipe),
                        style: Button.rightBorderedRadius(isRecipeActive),
                        child: Text(
                          'Recipe',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(color: isRecipeActive ? white : black),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 10.0),
                  Container(
                    color: lightGrey,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20.0),
                      children: [
                        Text(
                          'Main',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        for (final ingredient in widget.recipe.ingredients)
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80.0,
                                  child: Text(ingredient.measure),
                                ),
                                Text(
                                  ingredient.name,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _gotoOverviewPage() {
    Navigator.pop(context);
  }

  void _setIsReadyOnly(bool readOnly) => setState(() => isReadOnly = readOnly);

  void _selectTab(TabEnum tabName) {
    if (tabName == TabEnum.ingredient) {
      setState(() {
        isIngredientActive = true;
        isRecipeActive = false;
      });
    } else {
      setState(() {
        isIngredientActive = false;
        isRecipeActive = true;
      });
    }
  }
}

enum TabEnum { ingredient, recipe }
