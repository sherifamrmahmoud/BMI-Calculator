
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/cubit/bmi_cubit.dart';
import 'features/input/input_screen.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const BmiApp()));
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: child);
        },
        child: const InputScreen(),
      ),
    );
  }
}
