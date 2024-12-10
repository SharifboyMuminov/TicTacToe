import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils/app_colors.dart';
import 'package:tic_tac_toe/utils/app_size.dart';
import 'package:tic_tac_toe/utils/app_text_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.isActiveColorButton,
    required this.title,
    required this.onTab,
  });

  final bool isActiveColorButton;
  final String title;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.we),
      child: GestureDetector(
        onTap: onTab,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isActiveColorButton
                ? AppColors.accentColor
                : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.coinyRegular.copyWith(
                color: isActiveColorButton
                    ? AppColors.white
                    : AppColors.primaryColor,
                fontSize: 65.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
