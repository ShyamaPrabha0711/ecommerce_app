import 'package:ecommerce_app/models/home_response.dart';
import 'package:ecommerce_app/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final HomeService homeService;
  HomeProvider({required this.homeService}) {
    getAllAssetsHome();
  }

  HomeMainResponse? homeMainResponse;
  Future<void> getAllAssetsHome() async {
    _isLoading = true;
    try {
      notifyListeners();

      final response = await homeService.getHomeAssets();
      if (response.success != null && response.success == 1) {
        homeMainResponse = response;
      } else {
        homeMainResponse = null;
      }
    } catch (e) {
      homeMainResponse = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
