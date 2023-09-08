import 'package:flutter/material.dart';

import '../screens/about.dart';
import '../screens/products_overview_screen.dart';
import '../screens/add_product_screen.dart';
import '../screens/favorites_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300),) ,
          backgroundColor: Theme.of(context).primaryColor ,
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Product Overview'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.grid_3x3),
                title: const Text('Product Category'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Add Product'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(AddProductScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Cart Items'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.of(context).pushNamed(FavoritesScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('About'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(About.routeName);
                },
              ),
            ],
          ),
        );
  }
}