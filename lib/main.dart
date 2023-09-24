import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // //List<Product> products = List.generate(20, (index) => Product("Product", 10.0, 0));
  //   List<Product> products = List.generate(20, (index) => Product("Product s", 10.0, 0));
  List<Product> productss = [
    Product("Product 1", 10.0, 0),
    Product("Product 2", 15.0, 0),
    Product("Product 3", 20.0, 0),
    Product("Product 4", 10.0, 0),
    Product("Product 5", 15.0, 0),
    Product("Product 6", 20.0, 0),
    Product("Product 7", 10.0, 0),
    Product("Product 8", 15.0, 0),
    Product("Product 9", 20.0, 0),
    Product("Product 10", 10.0, 0),
    Product("Product 11", 15.0, 0),
    Product("Product 12", 20.0, 0),
    Product("Product 13", 10.0, 0),
    Product("Product 14", 15.0, 0),
    Product("Product 15", 20.0, 0),
    Product("Product 16", 10.0, 0),
    Product("Product 17", 15.0, 0),
    Product("Product 18", 20.0, 0),
    Product("Product 19", 15.0, 0),
    Product("Product 20", 20.0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(productss),
            ),
          );
        },
        child: Icon(Icons.shopping_cart)
      ),
      body: ListView.builder(
        itemCount: productss.length,
        itemBuilder: (context, index) {
          final product = productss[index];
          return ListTile(
            title: Text('${product.name}'),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Counte ${product.quantity}'),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        product.quantity++;
                        if (product.quantity == 5) {
                          // Show the dialog when the counter reaches 5
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text(
                                    'You\'ve bought 5 ${product.name}!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage(this.products);

  int getTotalQuantity() {
    int total = 0;
    for (Product product in products) {
      total += product.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Products in Cart: ${getTotalQuantity()}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
