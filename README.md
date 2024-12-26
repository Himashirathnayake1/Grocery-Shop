# 📱 Project Overview

Tapon is a feature-rich Flutter-based grocery store mobile application designed to provide a smooth and efficient shopping experience. The app includes various functionalities such as user authentication, product browsing, and cart management.

## ✨ Features

- **Launch Page**:
  - A visually appealing splash screen to welcome users.
  - ![Home Screen](Frontend/assets/images/b.jpg "Home Screen")
    

- **Enter Number Page**:
  - Secure and simple phone number input for authentication.

- **Home Page**:
  - A scrollable interface showcasing categories and featured products.

- **Products Page**:
  - Detailed view of products with images, names, and prices.

- **Add to Cart Page**:
  - Allows users to add and remove items from the cart.
  - Displays the total price dynamically.

## 🚀 Technical Highlights

- **State Management**: Implemented using Provider for seamless state handling.
- **Backend**: Node.js-based API for user authentication and product data.
- **Database**: MongoDB for storing user and product information.
- **UI Design**: Following Material Design principles for a modern look.

## 🛠 Installation

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/RishafH/Grocery-Shop.git
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Set up and run the frontend:
   - Navigate to the `Frontend` directory.
 

4. Run the app:
   ```bash
   flutter run
   ```

## 📦 Dependencies

- Flutter SDK
- Provider (State Management)
- Cupertino Icons

## 📋 Project Structure

```
GROCERY-SHOP/
│
├── Frontend/
│   ├── lib/
│   │   ├── Products/
│   │   │   ├── ProductDetails.dart
│   │   │   ├── ProductMenu.dart
│   │   │   ├── ProductMenu2.dart
│   │   │   ├── ProductMenu3.dart
│   │   │   └── ProductMenu4.dart
│   │   ├── User/
│   │   │   ├── AddToCart.dart
│   │   │   ├── ConfirmCart.dart
│   │   │   ├── EnterNumber.dart
│   │   │   ├── LaunchPage.dart
│   │   │   └── Profile.dart
│   │   ├── widgets/
│   │   │   ├── Loading.dart
│   │   │   ├── constants.dart
│   │   │   └── HomePage.dart
│   │   └── main.dart
│
└── ios/

```

## 🔧 Customization

- **Product Catalog**:
  - Update product-related details in the `Products/` folder, such as `ProductMenu.dart` and `ProductDetails.dart`.

- **Theme**:
  - Adjust styles and theming in `main.dart` to customize the app's appearance.

- **User Features**:
  - Enhance user-related functionality by modifying files in the `User/` folder, such as `AddToCart.dart` and `Profile.dart`.

- **Widgets**:
  - Reuse or customize components in the `widgets/` folder to maintain a consistent UI across the app.


## 🤝 Contributing

1. Fork the repository.
2. Create your feature branch:
   ```bash
   git checkout -b feature/AmazingFeatures
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some AmazingFeatures'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/AmazingFeatures
   ```
5. Open a pull request.

## 📄 License

Distributed under the MIT License. See LICENSE for more information.

Happy Shopping with Tapon Distributors! 🛒📱🍎
