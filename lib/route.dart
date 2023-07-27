import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/features/Address/screens/address_screen.dart';
import 'package:amazon_clone_app/features/Admin/screens/add_products_screen.dart';
import 'package:amazon_clone_app/features/Search/screens/search_screen.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/features/home/screens/category_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/features/order_detail/screens/order_detail_screen.dart';
import 'package:amazon_clone_app/features/product_detail/screens/product_detail_screen.dart';
import 'package:amazon_clone_app/models/order.dart';
import 'package:amazon_clone_app/models/products.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const AuthScreen(), settings: routeSetting);

    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(), settings: routeSetting);

    case BottomBar.routName:
      return MaterialPageRoute(
          builder: (_) => const BottomBar(), settings: routeSetting);

    case AddProductScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const AddProductScreen(), settings: routeSetting);

    case CategoryDealsScreen.routeName:
      var category = routeSetting.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryDealsScreen(category: category),
          settings: routeSetting);

    case SearchScreen.routeName:
      var searchQuery = routeSetting.arguments as String;
      return MaterialPageRoute(
          builder: (_) => SearchScreen(searchQuery: searchQuery),
          settings: routeSetting);

    case ProductDetailScreen.routeName:
      var product = routeSetting.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
          settings: routeSetting);

    case AddressScreen.routeName:
      var totalAmount = routeSetting.arguments as String;
      return MaterialPageRoute(
          builder: (_) =>  AddressScreen(totalAmount: totalAmount,),
          settings: routeSetting);

    case OrderDetailScreen.routeName:
      var order = routeSetting.arguments as Order;
      return MaterialPageRoute(
          builder: (_) => OrderDetailScreen(order: order),
          settings: routeSetting);      
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text('Screen does not exist!!')),
              ));
  }
}
