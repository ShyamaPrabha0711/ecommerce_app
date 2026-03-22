import 'package:ecommerce_app/providers/home_provider.dart';
import 'package:ecommerce_app/providers/login_provider.dart';
import 'package:ecommerce_app/utils/extensions/margin_extension.dart';
import 'package:ecommerce_app/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/home_response.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_styles.dart';
import '../../utils/constants/constants.dart';
import '../../widgets/category_item.dart';
import '../../widgets/home_banner.dart';
import '../../widgets/home_header.dart';
import '../../widgets/product_card.dart';

import '../../utils/constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final banners = homeProvider.homeMainResponse?.banner1 ?? [];
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: AppImage(
          assetName: AppStrings.cartIcon,
          width: 45,
          height: 39,
        ),
        actions: [
          AppSvg(assetName: AppStrings.searchIcon),
          15.wBox,
          AppSvg(assetName: AppStrings.favrtIcon),
          15.wBox,
          AppSvg(assetName: AppStrings.bellIcon),
          15.wBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  20.hBox,

                  HomeBanner(
                    imageUrls: banners
                        .map((e) => "$imageBaseUrl/images/banner/${e.image}")
                        .toList(),
                  ),
                  20.hBox,
                  _buildSectionHeader(AppStrings.categories),
                  15.hBox,
                  _buildCategoryList(
                    category: homeProvider.homeMainResponse?.categories ?? [],
                  ),
                ],
              ),
            ),
            5.hBox,
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  20.hBox,
                  _buildSectionHeader(AppStrings.featuredProducts),
                  10.hBox,
                  _buildProductList(),
                  20.hBox,
                  _buildSectionHeader(AppStrings.dailyBestSelling),
                  10.hBox,
                  _buildProductList(),
                  20.hBox,
                  AppImage(assetName: AppStrings.homeBanner),
                  20.hBox,
                  _buildSectionHeader(AppStrings.recentlyAdded),
                  10.hBox,
                  _buildProductList(),
                  20.hBox,
                  _buildSectionHeader(AppStrings.popularProducts),
                  10.hBox,
                  _buildProductList(),
                  20.hBox,
                  _buildSectionHeader(AppStrings.trendingProducts),
                  10.hBox,
                  _buildProductList(),
                  20.hBox,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.label.copyWith(color: AppColors.primary),
          ),
          const Row(
            children: [
              Icon(Icons.arrow_back_ios, color: AppColors.textColor),
              Icon(Icons.arrow_forward_ios, color: AppColors.textColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList({required List<CategoryElement> category}) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: category!.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return CategoryItem(
            title: category[index].category?.name ?? '',
            imageUrl:
                "$imageBaseUrl/images/category/${category[index].category!.image}",
          );
        },
      ),
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return ProductCard(
            name: "name",
            category: AppStrings.flourAndSugars,
            price: 62.00,
            oldPrice: 80.00,
            imageUrl: "https",
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: AppStrings.categories,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: AppStrings.cart,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: AppStrings.profile,
        ),
      ],
    );
  }
}
