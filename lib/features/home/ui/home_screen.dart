import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/doctor_list/doctor_blue_container.dart';
import 'widgets/doctor_list/doctors_bloc_builder.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specialization_list/specializations_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.h, 16.h, 20.h, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              SizedBox(height: 24.h),
              const DoctorsSpecialitySeeAll(),
              SizedBox(height: 18.h),
             const SpecializationsBlocBuilder(),
              SizedBox(height: 8.h),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
