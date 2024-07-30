import 'package:eletronic_conponents_store/models/product.dart';

List<Product> productList = <Product>[
  Product(
      id: 1,
      name: "Intel Core i3 14100",
      category: "CPU",
      price: 4400000,
      stocked: 100,
      description:
          "Bộ vi xử lý Intel Core i3 14100/Turbo up to 4.7GHz/4 Nhân 8 Luồng/12MB/LGA 1700"),
  Product(
      id: 2,
      name: "Intel Core i5 12400F",
      category: "CPU",
      price: 5490000,
      stocked: 50,
      description:
          "Bộ vi xử lý Intel Core i5 12400F/2.5GHz Turbo 4.4GHz/6 Nhân 12 Luồng/18MB/LGA 1700"),
  Product(
      id: 3,
      name: 'GeForce RTX 4060',
      category: 'GPU',
      price: 9990000,
      stocked: 200,
      description:
          'Card màn hình ASUS Dual GeForce RTX 4060 EVO OC Edition 8GB GDDR6 (DUAL-RTX4060-O8G-EVO)'),
  Product(
      id: 4,
      name: 'GeForce RTX 3060',
      category: 'GPU',
      price: 9990000,
      stocked: 120,
      description:
          'Card màn hình GIGABYTE GeForce RTX 3060 GAMING OC 12G (LHR) (GV-N3060GAMING-OC-12GD)'),
];
