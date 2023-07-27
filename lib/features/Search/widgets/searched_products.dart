// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone_app/common/widgets/stars.dart';
import 'package:amazon_clone_app/models/products.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedProducts extends StatelessWidget {
  final Product products;
  const SearchedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double myRating = 0;
    double avgRating = 0;
    for(int i = 0;i < products.rating!.length;i++){
      totalRating += products.rating![i].rating;
      if(products.rating![i].userId == Provider.of<UserProvider>(context, listen: false).user.id){
        myRating = products.rating![i].rating;
      }
    }
    if(totalRating != 0){
      avgRating = totalRating/products.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                products.images[0],
                fit: BoxFit.fitHeight,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      products.name,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child:  Stars(rating: avgRating),
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Text(
                      "\$${products.price}",
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(left: 10,),
                    child: const Text(
                      "Eligible for FREE Shipping"
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child:const Text(
                      "In Stock",style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
