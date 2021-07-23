import 'dart:math';

import 'package:get/get.dart';
import 'package:unitpay_test/models/product.dart';

class ListController extends GetxController {
  RxList<Product> productList = RxList([]);
  final _random = Random();

  void addProduct() {
    var key = products.keys.elementAt(_random.nextInt(products.length));
    productList.add(Product(name: key, image: products[key] ?? ''));
  }

  void generateList() {
    productList.value = List.generate(10000, (i) {
      var key = products.keys.elementAt(_random.nextInt(products.length));
      return Product(name: key, image: products[key] ?? '');
    });
  }

  @override
  void onInit() {
    generateList();
    super.onInit();
  }

  void removeProduct(Product product) {
    productList.remove(product);
  }

  Map<String, String> products = {
    'Coca Cola':
        'https://pixabay.com/get/gef2fa2f2d1a088f21f9b0cfa4e9c7369254ee80dfc79a56d016bb69676893aaee437768be208fc7ed4a56a2a5d23cbe5_640.jpg',
    'Ice Cream':
        'https://pixabay.com/get/ga3b84a4ec8ad2ea55dea5cf99519d7f8fe0fbf50edb27d8a75ca681a9dfe693b79b8d15701171ecb5baad53921764627_640.jpg',
    'Tea':
        'https://pixabay.com/get/g28e18d1285cdab09ed47d52f02e18d87bbec270ddfe511a8d91da2856eecb6c8c3340870fedee5a6f7f84dfb8f9aeb62_640.jpg',
    'Burger':
        'https://pixabay.com/get/g7c7b917638704c4855c1d90b47791df7307c490d46461514985226665c0975830be7ef8d6ae5d37f4700a3b081c9bdf1_640.jpg',
    'Coffee':
        'https://pixabay.com/get/g58072edcbf67c6fdf4c1cb0867b051e0f7f9cd48828fcc9d24fce1e4d3e9f49dbb6f242b34a480814c7dacf6620b1cfe_640.jpg',
    'Beer':
        'https://pixabay.com/get/g15b10070d44061e0e8dd51a480b85b8b7085436dfa8c509d199d552220fb7ff1ca19f598088cc37b2ddfa85eb7f1b63e_640.jpg',
    'Cake':
        'https://pixabay.com/get/g47f59362e10fccf6c2b82c9b7dd0d1324c729ffc5fa102f23737b445e67e329c01fa8cb2458365ef488028bc98475931_640.jpg',
    'Sushi':
        'https://pixabay.com/get/ga8e8fcc286e29cbc222bca8da224e6b92dfb401a966dba82cc7f09dc95767ba3d72e8fc7eb400d4f7a0773f4411d053d_640.jpg'
  };
}
