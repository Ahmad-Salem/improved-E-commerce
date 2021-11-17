import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/card_view_model.dart';
import 'package:salem/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<CardViewModel>(
        init: Get.find<CardViewModel>(),
        builder: (controller) => Container(
          height: MediaQuery.of(context).size.height * 0.68,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 350,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cardProductModel[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        CustomText(
                          text: controller.cardProductModel[index].name,
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
                        ),
                      ],
                    ),
                  ),
                  itemCount: controller.cardProductModel.length,
                  separatorBuilder: (context,index)
                  {
                    return SizedBox(width: 15,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
