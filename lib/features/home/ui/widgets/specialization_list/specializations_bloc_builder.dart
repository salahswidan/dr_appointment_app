import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../doctor_list/doctor_shimmer_loading.dart';
import '../doctor_list/doctors_list_view.dart';
import 'speciality_list_view.dart';
import 'speciality_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is SpecializationsSuccess ||
              current is SpecializationsError ||
              current is SpecializationsLoading,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializatioonDataList) {
            var specializationsList = specializatioonDataList;
            return setupSuccess(specializationsList);
          },
          specializationsError: (errorMessage) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return Column(
      children: [
        const SpecialityShimmerLoading(),
        SizedBox(height: 8.h),
        const DoctorsShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
