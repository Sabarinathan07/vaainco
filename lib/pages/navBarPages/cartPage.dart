import 'package:flutter/material.dart';

import '../../constant.dart';

class CartItem {
  String name;
  String imageUrl;
  double price;
  int quantity;

  CartItem({required this.name, required this.imageUrl, required this.price, this.quantity = 1});
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(name: "Product 1", imageUrl: "https://via.placeholder.com/150", price: 999),
    CartItem(name: "Product 2", imageUrl: "https://via.placeholder.com/150", price: 1999),
    CartItem(name: "Product 3", imageUrl: "https://via.placeholder.com/150", price: 499),
    CartItem(name: "Product 4", imageUrl: "https://via.placeholder.com/150", price: 1299),
    CartItem(name: "Product 5", imageUrl: "https://via.placeholder.com/150", price: 999),
    CartItem(name: "Product 6", imageUrl: "https://via.placeholder.com/150", price: 1999),
    CartItem(name: "Product 7", imageUrl: "https://via.placeholder.com/150", price: 499),
    CartItem(name: "Product 8", imageUrl: "https://via.placeholder.com/150", price: 1299),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body:

      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '\₹${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      Container(

                        decoration: BoxDecoration(
                          border: Border.all(color: vPrimaryColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item.quantity > 1) {
                                    item.quantity--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                              color: vPrimaryColor,
                            ),
                            Text(item.quantity.toString(),
                              style: const TextStyle(
                                color: vPrimaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  item.quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                              color: vPrimaryColor,

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Divider(thickness: 2),
                  const Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("₹200",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text('Total',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: vPrimaryColor,
                        ),),
                      // Text('\$${totalPrice.toStringAsFixed(2)}'),

                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: vPrimaryColor,
                      ),
                      onPressed: () {},
                      child: const Text('Proceed to Payment',

                      ),
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

