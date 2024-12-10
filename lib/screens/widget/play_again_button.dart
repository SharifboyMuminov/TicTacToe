import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/screens/widget/my_zoom_tap_animation.dart';
import 'package:tic_tac_toe/utils/app_colors.dart';
import 'package:tic_tac_toe/utils/app_size.dart';
import 'package:tic_tac_toe/utils/app_text_style.dart';

class PlayAgainButton extends StatelessWidget {
  const PlayAgainButton({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return MyZoomTapAnimation(
      onTap: onTab,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
          child: Text(
            "Play Again!",
            style: AppTextStyle.montserratSemiBold.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
