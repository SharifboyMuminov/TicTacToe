import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils/app_colors.dart';
import 'package:tic_tac_toe/utils/app_size.dart';
import 'package:tic_tac_toe/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  String winner = "";
  List<int> winnerIndex = [];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          children: [
            Text(
              winner,
              style: AppTextStyle.coinyRegular.copyWith(
                fontSize: 48.sp,
                color: AppColors.white,
              ),
            ),
            Expanded(
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.we),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: List.generate(
                  displayXO.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.all(5.we),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            displayXO[index] = "X";
                            checkWinner();
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: winnerIndex.contains(index)
                                ? AppColors.accentColor
                                : AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              displayXO[index],
                              style: AppTextStyle.coinyRegular.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 65.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2], // 1-qator
      [3, 4, 5], // 2-qator
      [6, 7, 8], // 3-qator
      [0, 3, 6], // 1-ustun
      [1, 4, 7], // 2-ustun
      [2, 5, 8], // 3-ustun
      [0, 4, 8], // Asosiy diagonal
      [2, 4, 6], // Qarama-qarshi diagonal
    ];

    for (var condition in winConditions) {
      String a = displayXO[condition[0]];
      String b = displayXO[condition[1]];
      String c = displayXO[condition[2]];
      // debugPrint(condition.toString());
      // debugPrint("a = $a");
      // debugPrint("b = $b");
      // debugPrint("c = $c");

      if (a.isNotEmpty && a == b && b == c) {
        debugPrint("Hello");
        setState(() {
          winner = a;
          winnerIndex = condition;
        });
      }
    }
  }
}
