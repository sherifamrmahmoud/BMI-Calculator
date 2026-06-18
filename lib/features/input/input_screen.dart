import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nti5/core/colors_manager.dart';
import 'package:nti5/core/styles_manager.dart';
import 'package:nti5/core/button.dart';

import 'package:nti5/features/input/widgtes/age_and_wieght.dart';
import 'package:nti5/features/input/widgtes/gender_card.dart';
import 'package:nti5/features/input/widgtes/result_screen.dart';

import '../cubit/bmi_cubit.dart';
import '../cubit/bmi_state.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hightquality = MediaQuery.of(context).size.height;
    final widthquality = MediaQuery.of(context).size.width;
    print("hightquality: $hightquality");
    print("widthquality: $widthquality");
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: StylesManager.whiteStyle.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          final cubit = context.read<BmiCubit>();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                /// gap top
                const Spacer(flex: 1),

                /// GENDER
                Expanded(
                  flex: 28,
                  child: Row(
                    children: [
                      Expanded(
                        child: GenderCard(
                          genderName: "male",
                          icon: Icons.male,
                          isSelected: state.gender == "male",
                          onTap: () => cubit.changeGender("male"),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: GenderCard(
                          genderName: "female",
                          icon: Icons.female,
                          isSelected: state.gender == "female",
                          onTap: () => cubit.changeGender("female"),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                /// HEIGHT
                Expanded(
                  flex: 22,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: StylesManager.whiteStyle.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          "${state.height.toInt()} cm",
                          style: StylesManager.whiteStyle.copyWith(
                            fontSize: 22.sp,
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2,
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            min: 100,
                            max: 220,
                            value: state.height,
                            activeColor: ColorsManager.secondaryColor,
                            onChanged: cubit.changeHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                /// AGE + WEIGHT
                Expanded(
                  flex: 28,
                  child: Row(
                    children: [
                      Expanded(
                        child: AgeAndWeight(
                          title: "AGE",
                          value: state.age,
                          onAdd: cubit.incrementAge,
                          onRemove: cubit.decrementAge,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: AgeAndWeight(
                          title: "WEIGHT",
                          value: state.weight,
                          onAdd: cubit.incrementWeight,
                          onRemove: cubit.decrementWeight,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                /// BUTTON
                Expanded(
                  flex: 11,
                  child: BmiButton(
                    text: "CALCULATE",
                    onTap: () {
                      final bmi = cubit.calculateBmi();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(bmi: bmi),
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(flex: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
