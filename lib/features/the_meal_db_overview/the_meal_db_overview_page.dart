import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/search_recipe_textfield.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/add_recipe_modal_form.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/empty_recipes_view.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class TheMealDBApiOverviewPage extends StatefulWidget {
  const TheMealDBApiOverviewPage({
    required this.recipes,
    required this.onGetRecipe,
    Key? key,
  }) : super(key: key);

  final List<Recipe> recipes;
  final Function(String) onGetRecipe;

  @override
  State<TheMealDBApiOverviewPage> createState() => _TheMealDBApiOverviewPageState();
}

class _TheMealDBApiOverviewPageState extends State<TheMealDBApiOverviewPage> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  void didUpdateWidget(covariant TheMealDBApiOverviewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hungryLabel,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        getInspiredLabel,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image(image: AssetImage(avatarSource)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: MealDBTextField(controller: searchController),
              ),
              widget.recipes.isNotEmpty
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            yourRecipesLabel,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const VerticalSpacing(height: 20.0),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, __) => const VerticalSpacing(height: 20.0),
                              itemBuilder: (_, index) {
                                final recipe = widget.recipes[index];
                                return RecipeCard(
                                  recipe: recipe,
                                  recipeIndex: index,
                                );
                              },
                              itemCount: widget.recipes.length,
                            ),
                          )
                        ],
                      ),
                    )
                  : EmptyRecipesView(onAddRecipe: _showAddRecipeForm)
            ],
          ),
        ),
      ),
      floatingActionButton: widget.recipes.isNotEmpty
          ? FloatingActionButton(
              onPressed: _showAddRecipeForm,
              child: const Icon(
                Icons.add,
                size: 40.0,
              ),
            )
          : const VerticalSpacing(height: 0.0),
    );
  }

  void _showAddRecipeForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
      builder: (_) => AddRecipeModalForm(
        onGetRecipe: widget.onGetRecipe,
        recipes: _getAllRecipeName(),
      ),
    );
  }

  List<String> _getAllRecipeName() => widget.recipes.map((recipe) => recipe.strMeal.toLowerCase()).toList();
}
