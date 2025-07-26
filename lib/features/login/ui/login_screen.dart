import 'package:dr_appointment_app/core/theming/styles.dart';
import 'package:dr_appointment_app/core/widgets/app_text_button.dart';
import 'package:dr_appointment_app/features/login/data/models/login_request_body.dart';
import 'package:dr_appointment_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/cubit/login_cubit.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                SizedBox(height: 8.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see you\'ve been up to since you last logged in ',
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: 36.h),
                Column(
                  children: [
                    const EmailAndPassword(),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    SizedBox(height: 16.h),
                    const TermsAndConditionsText(),
                    SizedBox(height: 60.h),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
      // LoginRequestBody(
      //   email: context.read<LoginCubit>().emailController.text,
      // password: context.read<LoginCubit>().passwordController.text)
    }
  }
}
