import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti5/core/colors_manager.dart';
import 'package:nti5/core/styles_manager.dart';

class GenderCard extends StatelessWidget {
  final String genderName;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.genderName,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: isSelected
              ? ColorsManager.secondaryColor
              : Colors.grey.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Icon(icon, color: Colors.white, size: 60.sp),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  genderName.toUpperCase(),
                  style: StylesManager.whiteStyle.copyWith(fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
