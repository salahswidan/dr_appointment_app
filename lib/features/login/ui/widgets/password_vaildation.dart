import 'package:dr_appointment_app/core/theming/colors.dart';
import 'package:dr_appointment_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least one lowercase letter', hasLowerCase),
        SizedBox(height: 2.h),
        buildValidationRow('At least one uppercase letter', hasUpperCase),
        SizedBox(height: 2.h),
        buildValidationRow('At least one number', hasNumber),
        SizedBox(height: 2.h),
        buildValidationRow('At least one special character', hasSpecialCharacter),
        SizedBox(height: 2.h),
        buildValidationRow('At least 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String test, bool hasValidated) {
    return Row(
      children: [
         CircleAvatar(
          radius: 2.5.r,
          backgroundColor: ColorsManager.gray,
        ),
    
        SizedBox(width: 6.w),
        Text(test,style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2.sp,
          color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
        ),),
      ],
    );
  }
}
