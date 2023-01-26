// ignore_for_file: prefer_const_constructors
import 'package:ecomers_api/detailsScreen/details.dart';
import 'package:ecomers_api/fetch_data.dart';

import 'package:ecomers_api/model/productModel.dart';
import 'package:ecomers_api/repository/fetch.dart';
import 'package:flutter/material.dart';

class Fetchproduct extends StatefulWidget {
  const Fetchproduct({super.key});

  @override
  State<Fetchproduct> createState() => _FetchproductState();
}

class _FetchproductState extends State<Fetchproduct> {
  late Future<List<Products>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = ProductRepo().fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('products'),
          actions: [
            IconButton(
                onPressed: () {
                  ProductRepo().addProduct(
                      titile: "favas fire",
                      category: "thanni ulla",
                      description: " prethekich onm parayan ila ",
                      double: -0,
                      image:
                          "https://nypost.com/wp-content/uploads/sites/2/2022/08/iranian-hulk-ig-02.jpg",
                      rating: {"value": 1.9, "count": 22});
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Products>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var productData = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 50,
                    mainAxisExtent: 350,
                  ),
                  itemCount: productData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Image.network(
                                productData[index].image!,
                                width: 90,
                                height: 180,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productData[index].title!),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(productData[index]
                                        .rating!
                                        .rate
                                        .toString())
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextButton(onPressed: (){
                                      ProductRepo().updateProduct(id: productData[index].id.toString(),
                                      titile: productData[index].title,
                                      price: productData[index].price
                                      );
                                    }, child: Text('Update')),
                                    TextButton(onPressed: (){
                                      ProductRepo().deleteProduct(id: productData[index].id.toString());
                                    }, child: Text('delete'))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                    // return InkWell(
                    //   onTap: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => DetailsScreen(
                    //             productsDetails: productData[index]),
                    //       )),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: 20.0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12.2),
                    //         color: Color.fromARGB(255, 222, 219, 219),
                    //       ),
                    //       child: Column(
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.only(top: 2),
                    //             child: Image.network(
                    //               '${productData.elementAt(index).image}',
                    //               height: 130,
                    //               width: 180,
                    //               fit: BoxFit.contain,
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.all(19),
                    //             child: Text("${productData.elementAt(index).category}"),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.black12,
                  ),
                );
              }
            }));
  }
}
