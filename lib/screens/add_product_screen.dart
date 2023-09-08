import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';
import '../models/product.dart';
import '../main.dart';
import '../screens/favorites_screen.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product-screen';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var name;
  var price;
  var imageUrl;
  var quantity;
  final _form = GlobalKey<FormState>();
  List<Product> products = [];
  var isFavorite = false;
  var productItem;

  void saveForm() {
    _form.currentState!.save();
    
  productItem = Product(
    id: DateTime.now().toString(),
    name: name,
    price: price,
    imageUrl: imageUrl,
    quantity: quantity,
    isFavorite: isFavorite,
  );

  setState(() {
    products.add(productItem);
  });

  HomePage(products);
  MyApp(products);
  FavoritesScreen(products);


Navigator.of(context).pop();

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Add Products'),
        // actions: [IconButton(icon: Icon(Icons.save), onPressed: (){
        //   saveForm();
        // })]
      ),
      body: products.isEmpty ? const Center(
        child: Text('Add Products by clicking on Button below'),
      ) : GridView(
        padding: const EdgeInsets.all(19),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 18 ,crossAxisCount: 2, mainAxisSpacing: 18),
        children: [
        ...(products.map((item){
          return GridTile(
              footer: Container(
                color: Colors.black38,
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: item.isFavorite
                            ? const Icon(
                                Icons.favorite, color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            item.isFavorite = !item.isFavorite;
                          FavoritesScreen(products);

                          });
                        },
                      ),
                      Column(children: [
                        Text(item.name.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold,),),
                        Text('Rs.${item.price}',  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,),),
                      ],),
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
                
                item.imageUrl == '' ? 'https://penshop.co.uk/wp-content/uploads/2018/02/The-10-Most-Expensive-Pens-Ever-Sold.jpg' : item.imageUrl,
              ),
              );
        }).toList())
      ]) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<dynamic>(
            context: context,
            builder: (context) {
              return Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Name of Product',
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (newValue) {
                            name = newValue.toString();
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Price of Product',
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          onSaved: (newValue) {
                            price = newValue.toString();
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Image Url of Product',
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (newValue) {
                            imageUrl = newValue.toString();
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Quantity of Product',
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          onSaved: (newValue) {
                            quantity = newValue.toString();
                          }),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(3),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Text('Add Product'),
                        onPressed: () {
                          saveForm();
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
