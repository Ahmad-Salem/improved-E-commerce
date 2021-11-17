import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/home_view_model.dart';
import 'package:salem/view/product_details_screen.dart';
import 'package:salem/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'a',
    'a',
    'a',
    'a',
    'a',
  ];
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ?  const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: primaryColor,
                ),
              ),
          )
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(text: "Categories"),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 18,
                          ),
                          CustomText(
                            text: 'See All',
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewProduct(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(text: controller.categoryModel[index].name)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.BestSellingProductModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  ProductDetailsScreen(
                      productModel: controller.BestSellingProductModel[index]),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 220,
                          child: Image.network(
                            controller.BestSellingProductModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.BestSellingProductModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    CustomText(
                      fontSize: 12,
                      text: controller
                              .BestSellingProductModel[index].description
                              .toString()
                              .substring(0, 25) +
                          " ...",
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.BestSellingProductModel[index].price
                              .toString() +
                          " \$",
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
