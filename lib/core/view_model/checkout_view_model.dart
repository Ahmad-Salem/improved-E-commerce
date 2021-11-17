import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/view/checkout/add_address_widget.dart';
import 'package:salem/view/checkout/delevery_time_widget.dart';
import 'package:salem/view/checkout/summary_widget.dart';
class CheckOutViewModel extends GetxController
{
  int  get index=>_index;
  late int _index;
  late List<Step> _steps;
  VoidCallback? _onStepCancel,_onStepContinue;



  VoidCallback?  onStepCancel() {
    return _onStepCancel;
  }

  VoidCallback?  onStepContinue() {
    return _onStepContinue;
  }


  List<Step> steps(){

    _steps = [
      Step(
        title: Text('Delivery'),
        content: DeliveryTime(),
        isActive: index >= 0,
        state: StepState.complete,
      ),
      Step(
        title: Text('Address'),
        content:  AddAddress(),
        isActive: index >= 1,
        state: StepState.disabled,
      ),
      Step(
        title: Text('Summary'),
        content:  Summary(),
        isActive: index >= 2,
        state: StepState.editing,
      ),
    ];

    update();
    return _steps;

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _index=0;

  }

  void setIndex(int x)
  {
    _index=x;
    update();
  }



}