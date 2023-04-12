import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/ingredients_card.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/note_text_field.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/popup_menu_button.dart';
import 'package:recipe_app_flutter/features/the_meal_db_details/widgets/recipe_instructions_card.dart';
import 'package:recipe_app_flutter/utilities/colors.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/tab_enum.dart';
import 'package:recipe_app_flutter/utilities/widget/button.dart';
import 'package:flutter/material.dart';

class TheMealDBApiDetailsPage extends StatefulWidget {
  const TheMealDBApiDetailsPage({
    required this.recipe,
    required this.onUpdateRecipeNote,
    required this.onDeleteRecipe,
    Key? key,
  }) : super(key: key);

  final Recipe recipe;
  final Function(String) onUpdateRecipeNote;
  final VoidCallback onDeleteRecipe;

  @override
  State<TheMealDBApiDetailsPage> createState() => _TheMealDBApiDetailsPageState();
}

class _TheMealDBApiDetailsPageState extends State<TheMealDBApiDetailsPage> {
  late final TextEditingController noteController;
  late final Map cardActiveTab;
  late bool isNoteEmpty;
  late bool isReadOnly;
  late bool isIngredientActive;
  late bool isRecipeActive;
  late TabEnum activeTab;

  @override
  void initState() {
    super.initState();
    noteController = TextEditingController(text: widget.recipe.note)..addListener(_updateIsNoteEmpty);
    isNoteEmpty = widget.recipe.note.isNotEmpty;
    isReadOnly = true;
    isIngredientActive = true;
    isRecipeActive = false;
    activeTab = TabEnum.ingredient;
    cardActiveTab = {
      TabEnum.ingredient: IngredientsCard(ingredients: widget.recipe.ingredients),
      TabEnum.recipe: RecipeInstructionsCard(instruction: widget.recipe.strInstructions),
    };
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
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
                      child: PopUpMenuButton(
                        setIsReadyOnly: _setIsReadyOnly,
                        onDeleteRecipe: widget.onDeleteRecipe,
                      ),
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
              padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notesLabel,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const VerticalSpacing(height: 10.0),
                  isReadOnly
                      ? Text(noteController.text)
                      : Column(
                          children: [
                            NoteTextField(controller: noteController),
                            const VerticalSpacing(height: 20.0),
                            ElevatedButton(
                              onPressed: isNoteEmpty ? _onUpdateNote : null,
                              style: Button.fluidButton(),
                              child: Text(
                                updateNotesLabel,
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
                          ingredientsLabel,
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
                          recipeLabel,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(color: isRecipeActive ? white : black),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 10.0),
                  cardActiveTab[activeTab]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onUpdateNote() {
    _setIsReadyOnly(true);
    if (noteController.text == widget.recipe.note) return;
    widget.onUpdateRecipeNote(noteController.text);
  }

  void _gotoOverviewPage() => Navigator.pop(context);

  void _setIsReadyOnly(bool readOnly) => setState(() => isReadOnly = readOnly);

  void _updateIsNoteEmpty() => setState(() => isNoteEmpty = noteController.text.isNotEmpty);

  void _selectTab(TabEnum tabName) {
    setState(() {
      isIngredientActive = tabName == TabEnum.ingredient;
      isRecipeActive = !isIngredientActive;
      activeTab = tabName;
    });
  }
}
