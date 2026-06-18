import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti5/core/styles_manager.dart';

class AgeAndWeight extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const AgeAndWeight({
    super.key,
    required this.title,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: StylesManager.whiteStyle.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                child: _CircleButton(icon: Icons.remove, onTap: onRemove),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: _CircleButton(icon: Icons.add, onTap: onAdd),
              ),
            ],
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: Icon(icon, color: Colors.white, size: 14.sp),
        ),
      ),
    );
  }
}
