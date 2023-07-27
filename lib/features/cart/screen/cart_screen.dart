import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/constraints/global.dart';
import 'package:amazon_clone_app/features/Address/screens/address_screen.dart';
import 'package:amazon_clone_app/features/Search/screens/search_screen.dart';
import 'package:amazon_clone_app/features/cart/widgets/cart_product.dart';
import 'package:amazon_clone_app/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone_app/features/home/widgets/address_box.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  

  void navigateToAddressScreen(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart.map((e) => sum+= e['quantity']*e['product']['price'] as int).toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Container(
                height: 42,
                padding: const EdgeInsets.only(left: 15),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(7),
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 7),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            ),
            Container(
              height: 42,
              color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(
                Icons.mic,
                color: Colors.black,
                size: 25,
              ),
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const AddressBox(),
          const CartSubTotal(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButton(
              text: 'Proceed to Buy (${user.cart.length}) items',
              onTap: () => navigateToAddressScreen(sum),
              color: Colors.yellow[600],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.black12.withOpacity(0.08),
            height: 1,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartProduct(index: index);
            },
            itemCount: user.cart.length,
          )
        ],
      )),
    );
  }
}
