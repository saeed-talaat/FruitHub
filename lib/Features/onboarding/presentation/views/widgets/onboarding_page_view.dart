import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_ecommerce_app/core/utils/app_colors.dart';
import 'package:fruits_ecommerce_app/core/utils/app_images.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisable: true,
          backGroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
          image: Assets.assetsImagesPageViewItem1Image,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: AppTextStyles.bold23.copyWith(fontFamily: 'Cairo'),
              ),
              Text(
                ' HUB',
                style: AppTextStyles.bold23.copyWith(
                  fontFamily: 'Cairo',
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  fontFamily: 'Cairo',
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        PageViewItem(
          isVisable: false,
          backGroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
          image: Assets.assetsImagesPageViewItem2Image,
          subTitle:
              ' نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            'ابحث وتسوق',
            style: AppTextStyles.bold23.copyWith(fontFamily: 'Cairo'),
          ),
        ),
      ],
    );
  }
}
