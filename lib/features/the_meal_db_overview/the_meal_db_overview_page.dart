import 'dart:async';

import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/recipe_list_view.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/search_recipe_textfield.dart';
import 'package:recipe_app_flutter/utilities/constant.dart';
import 'package:recipe_app_flutter/utilities/string_constant.dart';
import 'package:recipe_app_flutter/utilities/spacing.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';
import 'package:recipe_app_flutter/features/the_meal_db_overview/widgets/add_recipe_modal_form.dart';
import 'package:flutter/material.dart';

class TheMealDBApiOverviewPage extends StatefulWidget {
  const TheMealDBApiOverviewPage({
    required this.recipes,
    required this.searchedRecipes,
    required this.onGetRecipe,
    required this.onSearchRecipes,
    required this.onDisposeSearchedRecipes,
    Key? key,
  }) : super(key: key);

  final List<Recipe> recipes;
  final List<Recipe> searchedRecipes;
  final ValueChanged<String> onGetRecipe;
  final ValueChanged<String> onSearchRecipes;
  final VoidCallback onDisposeSearchedRecipes;

  @override
  State<TheMealDBApiOverviewPage> createState() => _TheMealDBApiOverviewPageState();
}

class _TheMealDBApiOverviewPageState extends State<TheMealDBApiOverviewPage> {
  late final TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController()..addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    widget.onDisposeSearchedRecipes();

    super.dispose();
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
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 40.0,
                ),
                child: MealDBTextField(
                  controller: _searchController,
                  onClearSearchField: _clearSearchField,
                ),
              ),
              Expanded(
                child: RecipeListView(
                  recipes: _searchController.text.isNotEmpty ? widget.searchedRecipes : widget.recipes,
                  label: _searchController.text.isNotEmpty ? yourResultsLabel : yourRecipeLabel,
                  onAddRecipe: _showAddRecipeForm,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _searchController.text.isEmpty
          ? widget.recipes.isNotEmpty
              ? FloatingActionButton(
                  onPressed: _showAddRecipeForm,
                  child: const Icon(
                    Icons.add,
                    size: 40.0,
                  ),
                )
              : const VerticalSpacing(height: noHeight)
          : widget.searchedRecipes.isNotEmpty
              ? FloatingActionButton(
                  onPressed: _showAddRecipeForm,
                  child: const Icon(
                    Icons.add,
                    size: 40.0,
                  ),
                )
              : const VerticalSpacing(height: noHeight),
    );
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () => widget.onSearchRecipes(_searchController.text),
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

  void _clearSearchField() {
    _searchController.clear();
    if (widget.searchedRecipes.isEmpty) return;
    widget.onDisposeSearchedRecipes();
  }

  List<String> _getAllRecipeName() => widget.recipes.map((recipe) => recipe.strMeal.toLowerCase()).toList();
}
