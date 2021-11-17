import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:salem/core/services/database/card_database_helper.dart';
import 'package:salem/model/card_product_model.dart';

class CardViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CardProductModel> _cardProductModel = [];

  List<CardProductModel> get cardProductModel => _cardProductModel;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;
  var dbHelper = CardDatabaseHelper.db;
  CardViewModel() {
    getAllProduct();

  }

  getAllProduct() async {
    _loading.value = true;

    var dbHelper = CardDatabaseHelper.db;
    _cardProductModel = await dbHelper.getAllProduct_dp();
    // print(_cardProductModel.toString());
    _loading.value = false;
    getTotalPrice();
    update();
  }

  bool isProductExist(String value) {
    var data= _cardProductModel.where((product) => (product.productId.contains(value)));
    if(data.length >=1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  addProductToCard(CardProductModel cardProductModel) async {

    if(_cardProductModel.isEmpty)
      {
        await dbHelper.insert(cardProductModel);
        _cardProductModel.add(cardProductModel);
        _totalPrice += (double.parse(cardProductModel.price.toString()) *
            cardProductModel.quantity);
        Get.snackbar(
          'Card Notify:',
          "The product added to the card.",
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }else{
        for (int i = 0; i < _cardProductModel.length; i++) {
          if (isProductExist(cardProductModel.productId)) {
            Get.snackbar(
              'Card Notify:',
              "The product already added to the card.",
              colorText: Colors.black,
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          } else {



            await dbHelper.insert(cardProductModel);
            _cardProductModel.add(cardProductModel);
            _totalPrice += (double.parse(cardProductModel.price.toString()) *
                cardProductModel.quantity);
            Get.snackbar(
              'Card Notify:',
              "The product added to the card.",
              colorText: Colors.black,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
    }

    update();
  }

  getTotalPrice() async {
    for (int i = 0; i < _cardProductModel.length; i++) {
      _totalPrice += (double.parse(_cardProductModel[i].price.toString()) *
          _cardProductModel[i].quantity);
      // print(_totalPrice);
    }
    update();
  }

  increaseQuantity(int index)async
  {
    _cardProductModel[index].quantity++;
    _totalPrice += (double.parse(_cardProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cardProductModel[index]);
    update();
  }

  decreaseQuantity(int index)async
  {
    if(_cardProductModel[index].quantity!=0)
      {
        _cardProductModel[index].quantity--;
        await dbHelper.updateProduct(_cardProductModel[index]);
      }

    _totalPrice += (double.parse(_cardProductModel[index].price.toString()));
    update();
  }



}
