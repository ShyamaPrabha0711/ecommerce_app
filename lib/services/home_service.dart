import 'package:ecommerce_app/models/home_response.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:ecommerce_app/utils/constants/config.dart';

class HomeService {
  final ApiService apiService;
  HomeService({required this.apiService});

  Future<HomeMainResponse> getHomeAssets() async {
    final response = await apiService.post(
      '/home/en',
      queryParams: {
        "id": authResponse?.customerdata?.id ?? '',
        "token": authResponse?.customerdata?.token,
      },
    );
    return HomeMainResponse.fromJson(response);
  }
}
