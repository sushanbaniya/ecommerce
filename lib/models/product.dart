class Product {
  String id;
  String name;
  var price;
  String imageUrl;
  var quantity;
  var isFavorite;
  var isCart;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.isFavorite = false,
    required this.imageUrl,
    this.isCart = false,
    required this.quantity,
  });
}
