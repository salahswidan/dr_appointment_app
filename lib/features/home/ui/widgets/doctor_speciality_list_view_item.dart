import 'package:dr_appointment_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationData;
  final int itemIndex;
  const DoctorSpecialityListViewItem({super.key, this.specializationData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),

            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    "assets/svgs/general_speciality.svg",
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(specializationData?.name ?? "Specialization", style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
  }
}