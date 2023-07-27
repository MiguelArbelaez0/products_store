class Product {
  int id;
  String title;
  double price;
  String description;
  String image;
  int quantity;

  Product({
    required this.quantity,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  double get subTotal => price * quantity;
}
