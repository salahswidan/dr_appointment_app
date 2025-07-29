import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

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
          specializationsSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationsError: (errorMessage) => setupError(
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializationsList ?? [],
          ),
          SizedBox(height: 8.h),
          DoctorsListView(doctorsList: specializationsList?[0]?.doctorsList),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
