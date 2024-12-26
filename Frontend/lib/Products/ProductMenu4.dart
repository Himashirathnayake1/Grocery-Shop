
import 'package:flutter/material.dart';
import 'package:tap_on/User/AddToCart.dart';
import 'package:tap_on/Products/ProductDetails.dart';

class UT_ToolMenu4 extends StatefulWidget {
  final String shopName;
  final String shopEmail;
  final String shopPhone;

  const UT_ToolMenu4({
    super.key,
    required this.shopName,
    required this.shopEmail,
    required this.shopPhone, required String shopId, required String product,
  });

  @override
  State<UT_ToolMenu4> createState() => _UT_ToolMenuState();
}

class _UT_ToolMenuState extends State<UT_ToolMenu4> {


  // Static local data for demonstration
  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'title': 'Chips',
      'price': '15.00',
      'discount': '0',
      'quantity': '10',
      'image': '', // Add Base64 encoded image string here
      'description': 'A durable hammer for all your needs',
      'availability': 'In Stock',
      'available_days': ['Monday', 'Tuesday', 'Wednesday'],
      'available_hours': '9 AM - 5 PM',
    },
    {
      'id': '2',
      'title': 'Murukku',
      'price': '25.00',
      'discount': '5',
      'quantity': '5',
      'image': '', // Add Base64 encoded image string here
      'description': 'Set of 6 screwdrivers with different sizes',
      'availability': 'In Stock',
      'available_days': ['Thursday', 'Friday'],
      'available_hours': '10 AM - 6 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.shopName} Products',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.green,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout_outlined,
                color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCart()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 47, 221, 105),
              Color.fromARGB(255, 17, 202, 79),
              Color.fromARGB(255, 45, 251, 114),
              Color.fromARGB(255, 45, 251, 182)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/b.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our New Products",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle "View More" button action
                          },
                          child: const Text(
                            "VIEW MORE",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Show no tools found message if the list is empty
              if (products.isEmpty)
                const Center(
                  child: Text(
                    'No tools exist for this shop',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return productTile(
                        context,
                        product['title']!,
                        product['price']!,
                        product['image']!,
                        product['description']!,
                        widget.shopEmail,
                        product,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productTile(
      BuildContext context,
      String title,
      String price,
      String image,
      String description,
      String shopEmail,
      Map<String, dynamic> product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Image.asset(
          'assets/images/images.jpeg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          '\Rs.$price',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.green,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToolDetails(
                title: title,
                price: price,
                image: image,
                description: description,
                shopEmail: shopEmail,
                shopPhone: widget.shopPhone,
                product: product,
              ),
            ),
          );
        },
      ),
    );
  }
}
