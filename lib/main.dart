import 'package:flutter/material.dart';

import './screens/about.dart';
import './screens/products_overview_screen.dart';
import './screens/add_product_screen.dart';
import './screens/favorites_screen.dart';
import './models/product.dart';

void main() => runApp(MyApp(const []));

class MyApp extends StatelessWidget {
  List<Product> products;
  MyApp(this.products, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProductsOverviewScreen(),
      theme: ThemeData(
        primaryColor: Colors.pink, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      routes: {
        About.routeName: (context) => const About(),
        ProductsOverviewScreen.routeName: (context) => const ProductsOverviewScreen(),
        AddProductScreen.routeName: (context) => const AddProductScreen(),
        FavoritesScreen.routeName: (context) => FavoritesScreen(products),

      }
    );
  }
}

class HomePage extends StatefulWidget {
  List<Product> products;
  
  HomePage(this.products, {super.key});
 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ProductsOverviewScreen() ;
  }
}
