import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/core/utils/app_decorations.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class AddressSummryWidget extends StatelessWidget {
  const AddressSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      width: double.infinity,
      decoration: AppDecorations.greyBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('عنوان التوصيل', style: AppTextStyles.bold13),
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesEdit),
                  SizedBox(width: 6),
                  Text(
                    'تعديل',
                    style: AppTextStyles.semiBold13.copyWith(
                      color: Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesLocation),
              SizedBox(width: 8),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                style: AppTextStyles.regular16.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
