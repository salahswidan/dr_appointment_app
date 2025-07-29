import 'package:dr_appointment_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialityListViewItem({
    super.key,
    this.specializationData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),

      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.darkBlue,
                    width: 1.5.r,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    "assets/svgs/general_speciality.svg",
                    height: 42.h,
                    width: 42.w,
                  ),
                ),
              )
              : CircleAvatar(
                radius: 28.r,
                backgroundColor: ColorsManager.lightBlue,
                child: SvgPicture.asset(
                  "assets/svgs/general_speciality.svg",
                  height: 40.h,
                  width: 40.w,
                ),
              ),
          SizedBox(height: 8.h),
          Text(
            specializationData?.name ?? "Specialization",
            style:
                itemIndex == selectedIndex
                    ? TextStyles.font14DarkBlueBold
                    : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
