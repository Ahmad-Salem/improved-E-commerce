import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/card_view_model.dart';
import 'package:salem/view/checkout/check_out_view.dart';
import 'package:salem/view/widgets/custom_button.dart';
import 'package:salem/view/widgets/custom_text.dart';

class CardView extends StatelessWidget {
  CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardViewModel>(
      init: Get.find<CardViewModel>(),
      builder: (controller) => Scaffold(
        body: controller.cardProductModel.length == 0
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/card_empty.svg',
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: 'Card Empty',
                      fontSize: 32,
                      alignment: Alignment.topCenter,
                    )
                  ],
                ))
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            child: Row(
                              children: [
                                Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    controller.cardProductModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text: controller.cardProductModel[index]
                                                    .name.length >
                                                10
                                            ? controller
                                                .cardProductModel[index].name
                                                .substring(0, 10)
                                            : controller
                                                .cardProductModel[index].name,
                                        fontSize: 24,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text: '\$' +
                                            controller
                                                .cardProductModel[index].price
                                                .toString(),
                                        fontSize: 22,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 140,
                                        height: 40,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .cardProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              alignment: Alignment.center,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                  Get.snackbar(
                                                    'Card Notify:',
                                                    "The product added to the card.",
                                                    colorText: Colors.black,
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                  );
                                                },
                                                child: const Icon(
                                                    Icons.minimize,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cardProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
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
                              text: 'TOTAL',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                            GetBuilder<CardViewModel>(
                              init: Get.find<CardViewModel>(),
                              builder: (controller) => CustomText(
                                text: "\$ ${controller.totalPrice}",
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          onPressed: () {
                            Get.to(() => CheckOutView());
                          },
                          text: 'CHECK OUT',
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
