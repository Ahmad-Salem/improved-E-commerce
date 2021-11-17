import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salem/core/services/home_services.dart';
import 'package:salem/model/category_model.dart';
import 'package:salem/model/product_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _BestSellingProductModel = [];
  List<ProductModel> get BestSellingProductModel => _BestSellingProductModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;

    HomeServices().getCategoryFromServer().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromjson(value[i].data() as Map<dynamic, dynamic>));
      }
      _loading.value = false;
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeServices().getBestSellingProductFromServer().then((value) {
      for (int i = 0; i < value.length; i++) {
        _BestSellingProductModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }
      _loading.value = false;
      update();
    });
  }
}
