import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-overview-screen';
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var isFavorite = false;
  var isFavorite2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'ECOMMERCE',
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(19),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 18 ,crossAxisCount: 2, mainAxisSpacing: 18),
        children: [
          GridTile(
              footer: Container(
                color: Colors.black38,
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: isFavorite
                            ? const Icon(
                                Icons.favorite, color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          (Icons.shopping_cart),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
              ),
              child: Image.network(
                'https://penshop.co.uk/wp-content/uploads/2018/02/The-10-Most-Expensive-Pens-Ever-Sold.jpg',
              ),
              ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: isFavorite2
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(
                            Icons.favorite_border,
                          ),
                    onPressed: () {
                      setState(() {
                        isFavorite2 = !isFavorite2;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      (Icons.shopping_cart),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            child: Image.network(
                'https://www.91-img.com/pictures/132396-v8-apple-iphone-xi-mobile-phone-large-1.jpg'),
          ),
          GridTile(
            footer: Container(
              color: Colors.black38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: isFavorite2
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(
                            Icons.favorite_border,
                          ),
                    onPressed: () {
                      setState(() {
                        isFavorite2 = !isFavorite2;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      (Icons.shopping_cart),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            child: Image.network(
                'https://www.91-img.com/pictures/132396-v8-apple-iphone-xi-mobile-phone-large-1.jpg'),
          ),
        ],
      ),
    );
  }
}
