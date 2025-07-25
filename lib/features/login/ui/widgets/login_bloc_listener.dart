import 'package:dr_appointment_app/core/helpers/extensions.dart';
import 'package:dr_appointment_app/core/theming/colors.dart';
import 'package:dr_appointment_app/features/login/data/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(
              Routes.homeScreen,
            );

          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
     context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon:  Icon(
          Icons.error,
          color: Colors.red,
          size: 32.sp,
        ),
        content: Text(error,style: TextStyles.font15DarkBlueMedium,),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
