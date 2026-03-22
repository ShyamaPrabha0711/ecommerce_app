import 'package:ecommerce_app/utils/extensions/margin_extension.dart';
import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_text_styles.dart';

import '../../utils/constants/app_strings.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final double oldPrice;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),

                  child: const Icon(
                    Icons.favorite_outline,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          10.hBox,
          Text(
            category,
            style: AppTextStyles.productCategory.copyWith(fontSize: 10),
          ),
          5.hBox,
          Text(
            name,
            style: AppTextStyles.categoryLabel,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          5.hBox,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$${price.toStringAsFixed(2)}  ',
                  style: AppTextStyles.price.copyWith(color: AppColors.primary),
                ),
                TextSpan(
                  text: '\$${oldPrice.toStringAsFixed(2)}',
                  style: AppTextStyles.oldPrice.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),

          10.hBox,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart, size: 16),
              label: const Text(AppStrings.add),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.lightGrey),
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
