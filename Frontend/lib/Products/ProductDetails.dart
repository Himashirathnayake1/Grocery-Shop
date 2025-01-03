import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_on/providers/cart_provider.dart';

class ToolDetails extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String description;
  final String shopEmail;
  final String shopPhone;
  final int qty;
  final String availability;
  final List<String> availableDays;
  final String availableHours;
  final double discount;

  final Map<String, dynamic> product;

  ToolDetails({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.shopEmail,
    required this.shopPhone,
    required this.product,
  }) : 
    qty = int.parse(product['quantity'] ?? '0'),
    availability = product['availability'] ?? 'N/A',
    availableDays = List<String>.from(product['available_days'] ?? []),
    availableHours = product['available_hours'] ?? 'N/A',
    discount = double.parse(product['discount'] ?? '0'),
    super(key: key);

  Widget _buildPriceCard() {
    final originalPrice = double.parse(price);
    final discountedPrice = originalPrice - (originalPrice * discount / 100);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Original Price:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'LKR $price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: discount > 0 ? TextDecoration.lineThrough : null,
                    color: discount > 0 ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
            if (discount > 0) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.discount, color: Colors.green[700]),
                      const SizedBox(width: 4),
                      Text(
                        'Discount:',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${discount.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Last Amount:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'LKR ${discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
              fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade400,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[600]!, Colors.green[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  color: Colors.black87,
                  width: screenWidth,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 16),
                          _buildPriceCard(),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quantity: $qty',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Status: $availability',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: availability == 'Available' ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Available Days:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            children: availableDays.map((day) => Chip(
                              label: Text(day),
                              backgroundColor: Colors.green[100],
                            )).toList(),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Working Hours: $availableHours',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(CartItem(
                            name: title,
                            category: '',
                            price: double.parse(price),
                            tag: '',
                            quantity: 1,
                            shopEmail: shopEmail,
                            product: product,
                          ));
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: screenWidth * 0.04, color: Colors.white),
                        ),
                        child: Text('AddToCart'),
                      ),
                      SizedBox(height: 350),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}