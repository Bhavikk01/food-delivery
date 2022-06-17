import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/popular_products_model.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AdminAddProduct extends StatelessWidget {
  AdminAddProduct({Key? key}) : super(key: key);

  final titleTextEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final imgEditingController = TextEditingController();
  final starsEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final updatedAtEditingController = TextEditingController();
  final createdAtEditingController = TextEditingController();
  final typeIdEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder:(controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: typeIdEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product id',
                          hintText: 'Product id',
                        ),
                      ),

                      TextFormField(
                        controller: titleTextEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                          hintText: 'Product Name',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: descriptionEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product description',
                          hintText: 'Product description',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: priceEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product price',
                          hintText: 'Product price',
                        ),
                      ),

                      const SizedBox(height: 15),
                      TextFormField(
                        controller: imgEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product img',
                          hintText: 'Product img',
                        ),
                      ),

                      const SizedBox(height: 15),
                      TextFormField(
                        controller: locationEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product location',
                          hintText: 'Product location',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: createdAtEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product createdAt',
                          hintText: 'Product createdAt',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: updatedAtEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product updatedAt',
                          hintText: 'Product updatedAt',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: starsEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Product stars',
                          hintText: 'Product stars',
                        ),
                      ),

                      ElevatedButton(
                          onPressed: () {
                            ProductModel productModel = ProductModel(
                                int.parse(typeIdEditingController.text.toString()),
                                titleTextEditingController.text.toString(),
                                descriptionEditingController.text.toString(),
                                int.parse(priceEditingController.text.toString()),
                                int.parse(starsEditingController.text.toString()),
                                imgEditingController.text.toString(),
                                locationEditingController.text.toString(),
                                updatedAtEditingController.text.toString(),
                                createdAtEditingController.text.toString(),
                              2
                            );

                            controller.postPopularProduct(productModel);
                          },
                          child: const Text("Add Product"),
                      ),
                    ]
                ),
              )
          )
      );
    }
    );
  }
}

