import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tap_on/User/ConfirmCart.dart';
import 'package:tap_on/providers/cart_provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReviewCartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReviewCartPage extends StatefulWidget {
  const ReviewCartPage({super.key});

  @override
  _ReviewCartPageState createState() => _ReviewCartPageState();
}

class _ReviewCartPageState extends State<ReviewCartPage> {
  @override
  void initState() {
    super.initState();
    _loadProductFromPreferences();
  }

  Future<void> _loadProductFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productString = prefs.getString('selectedProduct');

    if (productString != null) {
      Map<String, dynamic> productMap = jsonDecode(productString);
      Provider.of<CartProvider>(context, listen: false).addToCart(CartItem(
        name: productMap['title'],
        category: productMap['category'],
        price: double.parse(productMap['price']),
        tag: productMap['tag'],
        quantity: int.parse(productMap['quantity']),
        shopEmail: productMap['shopEmail'],
        product: productMap,
      ));
      setState(() {});
    }
  }

  void _showErrorAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, something went wrong',
      backgroundColor: Colors.black,
      titleColor: Colors.white,
      textColor: Colors.white,
    );
  }

  void _showCheckoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Checkout'),
          content: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...cartProvider.cartItems.map((item) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tool: ${item.name}'),
                      Text('Amount: LKR ${item.price} x ${item.quantity}'),
                      Text('Total: LKR ${item.price * item.quantity}'),
                      SizedBox(height: 10),
                    ],
                  )),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Confirmcart(provider: {}, status: '', order: {},)),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).clearCart();
            },
            child: const Text("Clear", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return cartProvider.cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartProvider.cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Card(
                              child: ListTile(
                                title: Text(item.name),
                                subtitle: Text('Quantity: ${item.quantity}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartProvider.increaseQuantity(item);
                                      },
                                      icon: Icon(Icons.add, color: Colors.blue),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cartProvider.decreaseQuantity(item);
                                      },
                                      icon: Icon(Icons.remove, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: Text('No items in the cart'));
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return Text(
                      'Total: LKR ${cartProvider.getTotalAmount().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: _showCheckoutConfirmation,
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}