import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/checkout_view_model.dart';
import 'package:salem/view/checkout/stepper_bottom_controllers.dart';

class CheckOutView extends StatelessWidget {


  StepperType _stepperType = StepperType.horizontal;

  CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder: (controller) =>
          Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text(
                  "CheckOut",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Container(
                    height: MediaQuery.of(context).size.height,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black)
                    // ),
                    child: Form(
                      child: Theme(
                        data: ThemeData(
                            primaryColor: primaryColor,
                            primarySwatch: Colors.green
                        ),
                        child: Stepper(
                          steps: controller.steps(),
                          physics: ClampingScrollPhysics(),
                          currentStep: controller.index,
                          type: _stepperType,
                          onStepTapped: (step) {
                            print(step.toString() + "x");
                            controller.setIndex(step);
                          },
                          onStepContinue: () {
                            print(controller.index);
                            if (controller.index < controller
                                .steps()
                                .length - 1) {
                              controller.setIndex(controller.index + 1);
                            } else {
                              print("complete Sir");
                            }
                          },
                          onStepCancel: () {
                            print(controller.index);
                            if (controller.index > 0) {
                              controller.setIndex(controller.index - 1);
                            } else {
                              controller.setIndex(0);
                            }
                          },
                          controlsBuilder: (BuildContext context,
                              ControlsDetails controls) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: StepperBottomControllers(
                                onStepCancel: controls.onStepCancel,
                                onStepContinue: controls.onStepContinue,),
                            );
                          },
                        ),
                      ),
                    ),
                  ),



             
          ),);
  }


}

