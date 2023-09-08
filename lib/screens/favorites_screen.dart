import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';
import '../models/product.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';
  List<Product> product;

  FavoritesScreen(this.product, {super.key})
  {
    print(product[0].name);
    print(product[0].isFavorite);

  }

  // const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Favorites Screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: widget.product.isEmpty
          ? Container()
          : ListView.builder(
            
              itemCount: widget.product.length,
              itemBuilder: (context, index) {
                print(widget.product[index].name);
                return widget.product[index].isFavorite == true
                    ? Container(
                        child: Column(
                          children: [
                            // print(widget.product[index].name);
                            Text(
                              // print(widget.product[index].name);
                              widget.product[index].name,
                            ),
                            Text(
                              widget.product[index].price,
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
    );
  }
}
