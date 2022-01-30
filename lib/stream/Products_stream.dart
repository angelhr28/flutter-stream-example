import 'dart:async';

const List<String> PRODUCTS = ["LECHE", "HUEVO", "PAN"];

class ProductsStream {
  Stream<List<String>> get getProducts async* {
    final List<String> products = [];
    for (String product in PRODUCTS) {
      await Future.delayed(const Duration(seconds: 2));
      products.add(product);
      yield products;
    }
  }

  final StreamController<int> _productsLength = StreamController<int>();

  Stream<int> get productLength => _productsLength.stream;

  ProductsStream() {
    getProducts.listen((event) => _productsLength.add(event.length));
  }

  dispose() {
    _productsLength.close();
  }
}
