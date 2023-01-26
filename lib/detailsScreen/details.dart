import 'package:ecomers_api/model/productModel.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({Key?key,required this.productsDetails}):super(key: key);
Products productsDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: Image.network(
                        productsDetails.image!,
                        height: 300,
                      ),
                    ),
                  ),
        ],
      ),
            ))
        ]
      )
    );
  }
}