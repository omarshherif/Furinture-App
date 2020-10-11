//import 'package:cached_network_image/cached_network_image.dart';

class Product {
  final int price;
  final String id, title, category, image, subTitle, description;
  final List<String> images;
  Product({
    this.id,
    this.images,
    this.price,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description,
  });

  // It create an Category from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      category: json["category"],
      subTitle: json["subTitle"],
      description: json["description"],
    );
  }
}

// Our Demo Product

List<Product> demoProducts = [
  Product(
    id: "1",
    images: [
      "https://i.imgur.com/sI4GvE6.png",
    ],
    price: 1600,
    title: "Wood Frame",
    image: "https://i.imgur.com/sI4GvE6.png",
    category: "Chair",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "2",
    images: [
      "https://i.imgur.com/JqBDr4s.png",
    ],
    title: "Yellow Armchair",
    price: 550,
    category: "Chair",
    image: "https://i.imgur.com/JqBDr4s.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "3",
    images: [
      "https://i.imgur.com/nIHmDvi.png",
    ],
    title: "Modern Armchair",
    price: 250,
    category: "Chair",
    image: "https://i.imgur.com/nIHmDvi.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "4",
    images: [
      "https://i.imgur.com/Mn7M3YV.png",
    ],
    title: "IKEA Ingolf Table",
    price: 1550,
    category: "Chair",
    image: "https://i.imgur.com/Mn7M3YV.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "5",
    images: [
      "https://i.imgur.com/WF5PsZj.png",
    ],
    title: "Yellow Arm",
    price: 1800,
    category: "Chair",
    image: "https://i.imgur.com/WF5PsZj.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "6",
    images: [
      "https://i.imgur.com/3eLrKqJ.png",
    ],
    title: "Scandinavian",
    price: 1320,
    category: "Chair",
    image: "https://i.imgur.com/3eLrKqJ.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
  Product(
    id: "7",
    images: [
      "https://i.imgur.com/JqKDdxj.png",
    ],
    title: "Yellow Arm",
    price: 289,
    category: "Chair",
    image: "https://i.imgur.com/JqKDdxj.png",
    subTitle: "Tieton Armchair",
    description: description,
  ),
];
const String description =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";
