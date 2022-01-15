import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../widgets/cart_badge.dart';
import '../providers/products.dart';
import '../widgets/products_grid.dart';

class ProjectOverviewScreen extends StatelessWidget {
  const ProjectOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: [
            CartBadge(
              onPressed: () => Navigator.pushNamed(context, CartScreen.route),
            ),
            Consumer<Products>(
              builder: (ctx, provider, child) => PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (FilterOptions selectedValue) {
                    Provider.of<Products>(context, listen: false)
                        .setFilterOptions(selectedValue);
                  },
                  itemBuilder: (_) => [
                        PopupMenuItem(
                          child: const Text('Only Favorites'),
                          enabled: FilterOptions.favorites !=
                              provider.selectedFilter,
                          value: FilterOptions.favorites,
                        ),
                        PopupMenuItem(
                          child: const Text('Show All'),
                          enabled: FilterOptions.all != provider.selectedFilter,
                          value: FilterOptions.all,
                        ),
                      ]),
            )
          ],
        ),
        body: const ProductsGrid(),
      ),
    );
  }
}
