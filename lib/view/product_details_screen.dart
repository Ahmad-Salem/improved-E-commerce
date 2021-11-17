import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/card_view_model.dart';
import 'package:salem/model/card_product_model.dart';
import 'package:salem/model/product_model.dart';
import 'package:salem/view/control_view.dart';
import 'package:salem/view/widgets/custom_button.dart';
import 'package:salem/view/widgets/custom_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel productModel;
  ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ControlView())),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: productModel.sized,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  height: 20,
                                  width: 30,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: productModel.color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      CustomText(
                        text: productModel.description,
                        fontSize: 18,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: productModel.price.toString() + "\$",
                        color: primaryColor,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  GetBuilder<CardViewModel>(
                    init: Get.find<CardViewModel>(),
                    builder: (controller) => CustomButton(
                      onPressed: () {
                        controller.addProductToCard(CardProductModel(
                          productId: productModel.productId,
                          name: productModel.name,
                          image: productModel.image,
                          quantity: 1,
                          price: productModel.price,
                        ));

                        // print(productModel.productId);
                      },
                      text: 'Add to Card',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
