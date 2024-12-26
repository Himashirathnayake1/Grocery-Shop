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
- Node.js and npm
- MongoDB (local or cloud instance)
- Android Studio or VS Code

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/tapon.git
   cd tapon
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Set up and run the backend:
   - Navigate to the `backend` directory.
   - Install dependencies:
     ```bash
     npm install
     ```
   - Start the server:
     ```bash
     npm start
     ```

4. Run the app:
   ```bash
   flutter run
   ```

## 📦 Dependencies

- Flutter SDK
- Provider (State Management)
- Twilio (Phone Authentication)
- MongoDB Node.js Driver
- Cupertino Icons

## 📋 Project Structure

```
tapon/
│
├── lib/
│   ├── models/
│   │   └── product.dart
│   ├── providers/
│   │   ├── cart_provider.dart
│   │   └── auth_provider.dart
│   ├── screens/
│   │   ├── launch_screen.dart
│   │   ├── number_entry_screen.dart
│   │   ├── home_screen.dart
│   │   ├── product_screen.dart
│   │   └── cart_screen.dart
│   └── main.dart
│
├── backend/
│   ├── app.js
│   ├── config.js
│   ├── routes/
│   │   ├── auth_routes.js
│   │   └── product_routes.js
│   └── models/
│       ├── user_model.js
│       └── product_model.js
│
├── assets/
│   ├── images/
│   └── data/
│       └── products.json
│
└── pubspec.yaml
```

## 🔧 Customization

- **Product Catalog**:
  - Update `assets/data/products.json` to modify the product catalog.

- **Theme**:
  - Adjust styles in `main.dart` to customize the theme.

- **Backend**:
  - Extend routes and models in the `backend` folder for additional features.

## 🤝 Contributing

1. Fork the repository.
2. Create your feature branch:
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a pull request.

## 📄 License

Distributed under the MIT License. See LICENSE for more information.

Happy Shopping with Tapon! 🛒📱🍎
