import 'package:flutter/material.dart';
import 'package:stream_example/stream/Products_stream.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ProductsStream productsStream = ProductsStream();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: StreamBuilder(
                  stream: productsStream.productLength,
                  builder: (_, AsyncSnapshot<int> snapshot) {
                    return Text('Tengo : (${snapshot.data ?? 0})');
                  }),
            ),
            body: StreamBuilder(
              stream: productsStream.getProducts,
              builder: (_, AsyncSnapshot<List<String>> snapshot) {
                final List<String> products = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, idx) {
                    return ListTile(
                      title: Text(products[idx]),
                    );
                  },
                );
              },
            )));
  }
}
