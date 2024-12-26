import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tap_on/Products/ProductMenu2.dart';
import 'package:tap_on/Products/ProductMenu3.dart';
import 'package:tap_on/Products/ProductMenu4.dart';
import 'package:tap_on/User/AddToCart.dart';
import 'package:tap_on/User/EnterNumber.dart';
import 'package:tap_on/User/Profile.dart';
import 'package:tap_on/Products/ProductMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage >= 2) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('TapOn', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[700],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EnterNumber()));
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UH_Profile()));
              },
              child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart_checkout_outlined,
                  color: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddToCart()),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              'Shop for Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Main Tool Grid
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ServiceCard(
                    imagePath: 'assets/images/grossery.jpg',
                    label: 'Milk and Shorties',
                    onTap: () {
                     // navigate to UT_ToolMenu page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UT_ToolMenu(shopName: '', shopEmail: '', shopPhone: '', shopId: '', product: '',)),
                      );
                    },
                  ),
                  ServiceCard(
                    imagePath: 'assets/images/home.jpg',
                    label: 'Vegetables',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UT_ToolMenu2(shopName: '', shopEmail: '', shopPhone: '', shopId: '', product: '',)),
                      );
                    },
                  ),
                  ServiceCard(
                    imagePath: 'assets/images/health.jpg',
                    label: 'Drinks',
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UT_ToolMenu3(shopName: '', shopEmail: '', shopPhone: '', shopId: '', product: '',)),
                      );
                    },
                  ),
                  ServiceCard(
                    imagePath: 'assets/images/mybaner.jpg',
                    label: 'Snacks',
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UT_ToolMenu4(shopName: '', shopEmail: '', shopPhone: '', shopId: '', product: '',)),
                      );
                    },
                  ),
                  ServiceCard(
                    imagePath: 'assets/images/elec.jpg',
                    label: 'Food and Beverages',
                    onTap: () {},
                  ),
                  ServiceCard(
                    imagePath: 'assets/images/baby.jpg',
                    label: 'Baby Care',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          // Advertisement Card with Gradient
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                AdvertisementCard(
                  backgroundColor: Colors.green[300]!,
                  icon: Icons.local_offer,
                  title: "Special Offer!",
                  description: "Up to 50% off on daily essentials. Grab it now!",
                  imagePath: 'assets/images/offer.jpg',
                ),
                AdvertisementCard(
                  backgroundColor: Colors.green[200]!,
                  icon: Icons.delivery_dining,
                  title: "Free Delivery",
                  description: "Free delivery on orders above \$50!",
                  imagePath: 'assets/images/sale.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.green[700],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Your one-stop shop for everything!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String label;
  final String? imagePath;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.label, required this.onTap, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdvertisementCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String description;
  final String imagePath;

  const AdvertisementCard({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [backgroundColor.withOpacity(0.1), backgroundColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
