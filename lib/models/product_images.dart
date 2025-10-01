List<String> productImage = [
  'assets/image/processed_image (3).png',
  'assets/image/processed_image (6).png',
  'assets/image/processed_image (13).png',
  'assets/image/processed_image (22).png',
];

class product {
  final String name;
  final String image;
  final double price;
  product({
    required this.name,
    required this.image,
    required this.price,
  });
}

List<product> products = [
  product(
      name: 'Linen Pants',
      image: 'assets/image/processed_image (2).png',
      price: 400),
  product(
      name: 'Polo Top',
      image: 'assets/image/processed_image (5).png',
      price: 450),
  product(
      name: 'Adidas',
      image: 'assets/image/processed_image (7).png',
      price: 550),
  product(
      name: 'Full-Zip hoodis',
      image: 'assets/image/processed_image (8).png',
      price: 1000),
  product(
      name: 'Leggings',
      image: 'assets/image/processed_image (9).png',
      price: 1500),
  product(
      name: 'Crew Socks',
      image: 'assets/image/processed_image (15).png',
      price: 80),
  product(
      name: 'Airpods Max',
      image: 'assets/image/processed_image (16).png',
      price: 25000),
  product(
      name: 'Appel Watch',
      image: 'assets/image/processed_image (19).png',
      price: 20000),
  product(
      name: 'Iphone 16',
      image: 'assets/image/processed_image (20).png',
      price: 60000),
  product(
      name: 'Crocs',
      image: 'assets/image/processed_image (27).png',
      price: 150),
];

final List<Map<String, String>> offers = [
  {
    'image': 'assets/image/processed_image (11).png',
    'description': '50% Discount T-shirt',
  },
  {
    'image': 'assets/image/processed_image (10).png',
    'description': 'Buy 1 Get 1 Free',
  },
  {
    'image': 'assets/image/processed_image (12).png',
    'description': 'Hot deal On Hand Bag',
  },
  {
    'image': 'assets/image/processed_image (18).png',
    'description': 'Clearance Sale Electronics'
  },
  {
    'image': 'assets/image/processed_image (28).png',
    'description': 'Special Price On Sunglasses',
  },
];
