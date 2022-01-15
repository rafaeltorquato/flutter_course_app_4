import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { favorites, all }

class ProjectOverviewScreen extends StatefulWidget {
  const ProjectOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProjectOverviewScreen> createState() => _ProjectOverviewScreenState();
}

class _ProjectOverviewScreenState extends State<ProjectOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    _showOnlyFavorites =
                        selectedValue == FilterOptions.favorites;
                  });
                },
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.favorites,
                      ),
                      const PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.all,
                      ),
                    ])
          ],
        ),
        body: ProductsGrid(
          showOnlyFavorites: _showOnlyFavorites,
        ),
      ),
    );
  }
}
