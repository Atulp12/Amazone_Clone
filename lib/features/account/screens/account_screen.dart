import 'package:amazon_clone_app/constraints/global.dart';
import 'package:amazon_clone_app/features/account/widgets/below_appbar.dart';
import 'package:amazon_clone_app/features/account/widgets/orders.dart';
import 'package:amazon_clone_app/features/account/widgets/top_button.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/amazon_in.png',
                width: 145,
                height: 45,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_none_outlined,color: Colors.black,),
                  ),
                  Icon(Icons.search,color: Colors.black,),
                ],
              ),
            )
          ]),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10,),
          TopButton(),
          SizedBox(height: 15,),
          OrderList(),
        ],
      ),
    );
  }
}
