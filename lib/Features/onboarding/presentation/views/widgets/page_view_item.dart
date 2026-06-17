import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/auth/presentation/views/signin_view.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backGroundImage,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.isVisable,
  });
  final String backGroundImage, image;
  final String subTitle;
  final Widget title;
  final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill),
              ),

              Positioned(
                height: 270,
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),

              Visibility(
                visible: isVisable,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsOnBoardingSeen, true);
                    Navigator.pushReplacementNamed(
                      context,
                      SigninView.routeName,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style: AppTextStyles.regular13.copyWith(
                        color: Color(0xff949D9E),
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13.copyWith(
              fontFamily: 'Cairo',

              color: Color(0xff4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
