import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/screens/home_screen/home_screen.dart';
import 'package:tic_tac_toe/utils/app_colors.dart';
import 'package:tic_tac_toe/utils/app_size.dart';
import 'package:tic_tac_toe/utils/app_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isShowAnimation = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    Future.microtask(() {
      setState(() {
        isShowAnimation = true;
      });
    });

    return Scaffold(
      body: AnimatedOpacity(
        opacity: isShowAnimation ? 1 : 0,
        duration: const Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: width),
            SizedBox(
              width: 170.we,
              height: 170.we,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/app_logo.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            10.getH(),
            Text(
              "TicTacToe",
              style: AppTextStyle.coinyRegular.copyWith(
                fontSize: 33.sp,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
