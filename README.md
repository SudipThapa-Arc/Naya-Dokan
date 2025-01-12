# 🌐 Naya Dokan - Modern E-commerce App

A sleek and modern e-commerce application built with Flutter, offering a seamless shopping experience with a beautiful UI and robust functionality.
(Under Construction)

## 💡 Key Features

- 🔒 **Secure Authentication**: Powered by [Firebase Auth](https://firebase.google.com/products/auth).
- 🗺️ **Beautiful Product Catalog**: Includes search functionality for easy browsing.
- 🛒 **Shopping Cart Management**: Effortlessly manage your cart.
- 💳 **Smooth Checkout Process**: Streamlined for a hassle-free experience.
- 🌟 **Product Ratings and Reviews**: Engage with the community.
- 📲 **Responsive Design**: Optimized for both web and mobile platforms.

## 🚀 Technologies Used

- **Frontend Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev)
- **Authentication**: [Firebase Auth](https://firebase.google.com/products/auth)
- **Database**: [Cloud Firestore](https://firebase.google.com/products/firestore)
- **Navigation**: [Go Router](https://pub.dev/packages/go_router)
- **UI Components**: Custom Material Design
- **Styling**: [Google Fonts](https://fonts.google.com)
- **Loading States**: Shimmer Effects

## 🌐 Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── authentication/
│   ├── product/
│   ├── cart/
│   └── checkout/
├── providers/
├── routes/
└── services/
```

## 🛠️ Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/SudipThapa-Arc/Naya-Dokan.git
   cd naya-dokan
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new Firebase project.
   - Add your Firebase configuration to `web/index.html`.
   - Enable Authentication and Firestore.

4. **Run the app**
   ```bash
   flutter run
   ```

## 💻 Usage

1. **Authentication**
   - Sign up with email and password.
   - Login with existing credentials.
   - Secure password recovery.

2. **Shopping**
   - Browse products with smooth pagination.
   - Search products by name or category.
   - View detailed product information.
   - Add items to the cart.

3. **Checkout**
   - Review cart items.
   - Add shipping information.
   - Select payment method.
   - Complete purchase.

## 🎨 UI Components

The app uses several custom components for consistency:

- `CustomTextField`: Enhanced text input with validation.
- `CustomButton`: Styled buttons with loading states.
- `ProductCard`: Beautiful product display cards.
- `ShimmerLoading`: Elegant loading animations.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Sudip Thapa** - Creator and initial work

##  Acknowledgments

- Flutter Team for the amazing framework.
- Firebase for backend services.
- All contributors who helped with the project.

---

Made with ❤️ by **Sudip Thapa** using Flutter.

